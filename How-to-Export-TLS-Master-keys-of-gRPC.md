[[_TOC_]]

# How to Export TLS Master keys of gRPC

This page introduces some investigations on how to export the TLS master key of gRPC for Wireshark. In theory, as long as the session secret keys of TLS are exported into the file in format of Wireshark [key log file](/tls) from client or server side, the gRPC traffic encrypted in TLS can be parsed by Wireshark (described on [Wireshark gRPC wiki page](/grpc). Unfortunately, not all languages that implement gRPC currently support this feature.

## Golang

The [grpc-go](https://github.com/grpc/grpc-go) supports exporting the TLS master key of gRPC with the help of the [keyLogWriter feature](https://golang.org/pkg/crypto/tls/#example_Config_keyLogWriter) of the [golang](golang.org).

Following gRPC client-side code is modified based on https://github.com/grpc/grpc-go/blob/v1.34.x/examples/features/encryption/TLS/client/main.go.

```golang
package main

import (
	"context"
	"crypto/tls"
	"crypto/x509"
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"time"

	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"
	"google.golang.org/grpc/examples/data"
	ecpb "google.golang.org/grpc/examples/features/proto/echo"
)

// Note that I changed the port from 50051 to 60051, because I decode the 
// traffic on 50051 as plain HTTP2, and decode traffic on 60051 as TLS.
// So that you should not forget to change server port from 50051 to 60051 too.
var addr = flag.String("addr", "localhost:60051", "the address to connect to")

func callUnaryEcho(client ecpb.EchoClient, message string) {
	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()
	resp, err := client.UnaryEcho(ctx, &ecpb.EchoRequest{Message: message})
	if err != nil {
		log.Fatalf("client.UnaryEcho(_) = _, %v: ", err)
	}
	fmt.Println("UnaryEcho: ", resp.Message)
}

// The keyFile is the path of key log file.
func NewCredentials(certFile, serverNameOverride, keyFile string) (credentials.TransportCredentials, error) {
	b, err := ioutil.ReadFile(certFile)
	if err != nil {
		return nil, err
	}
	cp := x509.NewCertPool()
	if !cp.AppendCertsFromPEM(b) {
		return nil, fmt.Errorf("credentials: failed to append certificates")
	}
	// w: = os.Stdout // for debug
	w, err := os.OpenFile(keyFile, os.O_WRONLY|os.O_CREATE|os.O_TRUNC, 0600)
	if err != nil {
		return nil, err
	}
	return credentials.NewTLS(&tls.Config{
		ServerName:   serverNameOverride,
		RootCAs:      cp,
		KeyLogWriter: w,
	}), nil
}

func main() {
	flag.Parse()

	// Create tls based credential.
	creds, err := NewCredentials(data.Path("x509/ca_cert.pem"), "x.test.example.com", "d:\\keyfile.txt")
	if err != nil {
		log.Fatalf("failed to load credentials: %v", err)
	}

	// Set up a connection to the server.
	conn, err := grpc.Dial(*addr, grpc.WithTransportCredentials(creds), grpc.WithBlock())
	if err != nil {
		log.Fatalf("did not connect: %v", err)
	}
	defer conn.Close()

	// Make a echo client and send an RPC.
	rgc := ecpb.NewEchoClient(conn)
	callUnaryEcho(rgc, "hello world")
}
```

After running (the command like "$> `go run client/main.go`"), the exported key materials will be written to the file "d:\keyfile.txt". You can set the *'(Pre)-Master-Secret log filename'* (*tls.keylog_file*) preference of Wireshark TLS to this file, and decode the traffic on 60051 port as tls to dissect the encrypted gRPC messages. Please refer to [Wireshark TLS wiki page](/tls) for how to use dissect TLS with the key log file.

>Note that the implementation TLS of golang is not relied on openssl or boringssl.

## Java

There are two ways to export the key materials of TLS for [grpc-java](https://github.com/grpc/grpc-java) capture files.

### Using jSSLKeyLog

This is easiest way, although it doesn't support native boringssl.

The main steps include:

- Download jSSLKeyLog from https://jsslkeylog.github.io/ .
- Make sure your client or server code using JDK security provider (by using `GrpcSslContexts.configure(sslServerContextBuilder, Security.getProvider("SunJSSE"))`).
- Then run the client or server program with `-javaagent:path/to/jSSLKeyLog.jar=/path/to/your_logfile.log` VM parameter, for example:

```cmd
java -javaagent:mylibs/jSSLKeyLog.jar=d:/keyfile.txt ... -jar client_or_server.jar ...
```

You will get the tls keyfile 'd:/keyfile.txt'.

If you capture at the grpc client side, the initialization code may like:

```java
    ...
    NettyChannelBuilder channelBuilder = NettyChannelBuilder.forAddress(host, port);

    if (secure) {
        SslContextBuilder sslClientContextBuilder = GrpcSslContexts.forClient().trustManager(new File("cert/server.crt"));
        sslClientContextBuilder.protocols("TLSv1.2");

        // Note that you can not use 
        // GrpcSslContexts.configure(sslClientContextBuilder, SslProvider.OPENSSL).
        //
        // If you does not include boringssl dependency in your pom.xml (or class path),
        // you can also use GrpcSslContexts.configure(sslClientContextBuilder) instead.
        //
        // Security.getProvider("SunJSSE") also can be replaced
        // by Security.getProviders()[0] if boringssl library is not in your class path.
        SslContext clientSslCtx = GrpcSslContexts.configure(sslClientContextBuilder,
                                     Security.getProvider("SunJSSE")).build();

        channelBuilder
            .sslContext(clientSslCtx)
            .negotiationType(NegotiationType.TLS);
    } else {
        channelBuilder.negotiationType(NegotiationType.PLAINTEXT);
    }

    this.channel = channelBuilder.build();
    blockingStub = new PersonSearchBlockingStub(channel, useJson);
    ...
```

If you capture at the server side, the server starting code might be changed to:

```java
    ...
    NettyServerBuilder serverBuilder = NettyServerBuilder.forPort(port).addService(
                useJson ? new PersonSearchJsonImpl() : new PersonSearchImpl()
            );
    
    if (secure)  {
        SslContextBuilder sslServerContextBuilder = GrpcSslContexts

                .forServer(new File(certChainFilePath), new File(privateKeyFilePath));
        //Note that you can use GrpcSslContexts.configure(sslServerContextBuilder, SslProvider.OPENSSL);
        SslContextBuilder serverSslCtxBuilder = GrpcSslContexts.configure(sslServerContextBuilder, Security.getProvider("SunJSSE"));
        
        SslContext serverSslCtx = serverSslCtxBuilder.build();
        serverBuilder.sslContext(serverSslCtx);
    }
    
    server = serverBuilder.build().start();
    ...
```

Test environment:
- grpc-java version: 1.36.0-SNAPSHOT
- protobuf and protoc version: 3.12.0
- openJDK:
  - openjdk-8u252-b09: support TLS1.2, but not support TLS1.3
  - openjdk-11.0.13_8: support both TLS1.2 and TLS1.3

### Rewriting class `ProtocolNegotiators`

This is just a trick and is not recommended.
You can rewrite the java class *'io.grpc.netty.ProtocolNegotiators'* based on the source code of the grpc-java library version you used and put it in your classpath. The key modification is add the code
```java
ctx.pipeline().addBefore(ctx.name(), null, SslMasterKeyHandler.newWireSharkSslMasterKeyHandler());
```
in the `handlerAdded0` method of the `ClientTlsHandler` class or the `handlerAdded` method of the `ServerTlsHandler` class. For example, if you put it in the `ClientTlsHandler` class for exporting the master key in the grpc client-side:

```java
@Override
protected void handlerAdded0(ChannelHandlerContext ctx) {
	SSLEngine sslEngine = sslContext.newEngine(ctx.alloc(), host, port);
	SSLParameters sslParams = sslEngine.getSSLParameters();
	sslParams.setEndpointIdentificationAlgorithm("HTTPS");
	sslEngine.setSSLParameters(sslParams);
	ctx.pipeline().addBefore(ctx.name(), /* name= */ null, this.executor != null
		? new SslHandler(sslEngine, false, this.executor)
		: new SslHandler(sslEngine, false));
	// add following code for exporting master for wireshark
        if (Boolean.getBoolean(SslMasterKeyHandler.SYSTEM_PROP_KEY)) {
            ctx.pipeline().addBefore(ctx.name(), null,
                SslMasterKeyHandler.newWireSharkSslMasterKeyHandler());
        }
}
```
This will write master keys to the log named "io.netty.wireshark". You can configure the log4j.xml for exporting master keys to a key log file:
```xml
<appender name="key-file" class="org.apache.log4j.RollingFileAppender"> 
	<param name="file" value="d:/keyfile.txt"/>
	<layout class="org.apache.log4j.PatternLayout"> 
		<param name="ConversionPattern" value="%m%n"/>
	</layout>
</appender>
<category name="io.netty.wireshark">
	<priority value="DEBUG" />
	<appender-ref ref="key-file" />
</category>
```
Enable this feature by setting the system property
```
   -Dio.netty.ssl.masterKeyHandler=true
```
or
```java
   System.setProperty(SslMasterKeyHandler.SYSTEM_PROP_KEY, "true");
```
That will make the master keys be written to the file `d:\keyfile.txt'.

This is just a workaround because the class *'io.grpc.netty.ProtocolNegotiators'* may be different each version. [Formal solution](https://github.com/grpc/grpc-java/issues/7199) based on the [SslMasterKeyHandler](https://github.com/netty/netty/pull/8653) feature of netty may be provied in the future.

## C++

The good news is "TLS Session Keys export for GRPC C++" PR (pull request) is merged recently (https://github.com/grpc/grpc/pull/26812). That might be released in the near future.

We can configure key log file by following EXPERIMENTAL API (in include/grpc/grpc_security.h):

```c
/**
 * EXPERIMENTAL API - Subject to change.
 * Configures a grpc_tls_credentials_options object with tls session key
 * logging capability. TLS channels using these credentials have tls session
 * key logging enabled.
 * - options is the grpc_tls_credentials_options object
 * - path is a string pointing to the location where TLS session keys would be
 *   stored.
 */
GRPCAPI void grpc_tls_credentials_options_set_tls_session_key_log_file_path(
    grpc_tls_credentials_options* options, const char* path);
```
or C++ method of TlsCredentialsOptions object:
```c++
void TlsCredentialsOptions::set_tls_session_key_log_file_path(
    const std::string& tls_session_key_log_file_path)
```

> The set_tls_session_key_log_file_path method relies on the [SSL_CTX_set_keylog_callback](https://www.openssl.org/docs/man1.1.1/man3/SSL_CTX_set_keylog_callback.html) (since openssl 1.1.1) or [SSL_get_client_random/SSL_get_server_random/SSL_SESSION_get_master_key](https://www.openssl.org/docs/man1.1.1/man3/SSL_SESSION_get_master_key.html) methods of openssl or boringssl.

> This function is EXPERIMENTAL only because TlsCredentialsOptions is EXPERIMENTAL now.

## C#/Python/...

At present, the GRPC implementation of these languages does not support this feature. However, since these implementations are all based on GRPC C++, it is possible that they will support this feature in the near future.

You may also try the methods described in [Wireshark tls wiki page](/tls).

> This wiki page will be updated if there's new progress.

# Sample Captures
- [grpc_person_search_protobuf_and_json_tls.pcapng][] -- Person search gRPC sample captures(60051 for protobuf payload and 60052 for json).
- [grpc_person_search_protobuf_and_json_tls.keylog.txt][] -- Key log file for grpc_person_search_protobuf_and_json_tls.pcapng.

[grpc_person_search_protobuf_and_json_tls.keylog.txt]: uploads/bdb819da1d262ac9226a9d9079eedb8d/grpc_person_search_protobuf_and_json_tls.keylog.txt
[grpc_person_search_protobuf_and_json_tls.pcapng]: uploads/bf889abf927b7d041b34a136dce7e176/grpc_person_search_protobuf_and_json_tls.pcapng
