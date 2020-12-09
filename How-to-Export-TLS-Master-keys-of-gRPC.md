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

The [grpc-java](https://github.com/grpc/grpc-java) does not support exporting the master key of TLS yet. But there is a trick to extract the secrets: you can rewrite the java class *'io.grpc.netty.ProtocolNegotiators'* based on the source code of the grpc-java library version you used and put it in your classpath. The key modification is add the code
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
	// add for exporting master for wireshark
	if (Boolean.getBoolean(System.getProperty(SslMasterKeyHandler.SYSTEM_PROP_KEY))) {
		// note that the '.addLast()' is not work
		ctx.pipeline().addBefore(ctx.name(), null, SslMasterKeyHandler.newWireSharkSslMasterKeyHandler());
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
That will make the master keys be written to the file `d:\keyfile.txt'.

This is just a workaround because the class *'io.grpc.netty.ProtocolNegotiators'* may be different each version. [Formal solution](https://github.com/grpc/grpc-java/issues/7199) based on the [SslMasterKeyHandler](https://github.com/netty/netty/pull/8653) feature of netty may be provied in the future.

## C++/C#/Python/...

Unfortunately, these language-specific gRPC implementations currently do not support the feature of exporting master keys yet. But most of them implement TLS using openssl or boringssl, one day they may explose the [SSL_CTX_set_keylog_callback](https://www.openssl.org/docs/man1.1.1/man3/SSL_CTX_set_keylog_callback.html) (since openssl 1.1.1) or [SSL_get_client_random/SSL_get_server_random/SSL_SESSION_get_master_key](https://www.openssl.org/docs/man1.1.1/man3/SSL_SESSION_get_master_key.html) methods to let user to export the master keys into key log files.

You may also try the methods described in [Wireshark tls wiki page](/tls).

> This wiki page will be updated if there's new progress.