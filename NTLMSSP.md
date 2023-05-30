# NTLM Security Support Provider

NTLMSSP is a Microsoft protocol for authentication using the NTLM protocol.

Open specification: [\[MS-NLMP\]](https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-nlmp/b38c36ed-2804-4868-a9ff-8dd3182128e4)

## Decryption of NTLM-encrypted traffic

Wireshark knows how to decrypt NTLM-encrypted traffic, as long as you give it the required secrets. Then it can decrypt the NTLM exchanges: both the NTLM challenge/response and further protocol payloads (like [DCE/RPC](/DCE/RPC) that may be encrypted with keys derived from the NTLM authentication.

Here's how the NTLM authentication at the beginning of a [DRSUAPI](/DRSUAPI) ([DCE/RPC](/DCE/RPC)) session looks like before providing the password or the hash:

![before_nt_password](uploads/0617dae4c7956273ce2a513f6ddc016c/before_nt_password.png)And after providing the password/hash, notice the additional info highlighted in blue:

![after_nt_password](uploads/f99248ef9db46866bcb72b20c53a151e/after_nt_password.png)

Then, before providing the password/hash, the `DsGetDomainControllerInfo` request payload is not readable since it's "encrypted stub data":

![encrypted_stub](uploads/60c5cc65489f340d1bf71efaf3cf29b5/encrypted_stub.png)

But after providing the password/hash, it becomes "decrypted stub data" (decrypted data is invalid in this screenshot due to bug [#19000](https://gitlab.com/wireshark/wireshark/-/issues/19000) which was fixed in v4.0.6, backported to v3.6.14)

![decrypted_stub](uploads/32b3687674dd3adc4e957061f0dfe79a/decrypted_stub.png)

### By providing the NT hash in a keytab file
If you only have the NT hash (aka "NTLM hash" ) of the account, you can still decrypt NTLM encrypted traffic by providing the hash in a keytab file (yes it's surprising since a keytab file is usually meant for Kerberos, but it works!). You can refer to this [Decrypt Kerberos/NTLM “encrypted stub data” in Wireshark](https://medium.com/tenable-techblog/decrypt-encrypted-stub-data-in-wireshark-deb132c076e7#e6a4) tutorial which describes how to create the keytab file and to pass it to Wireshark. This technique is also explained in this Capture-the-Flag challenge write-up: [Insomni'Hack Teaser 2023 - Autopsy](https://tipi-hack.github.io/2023/01/22/insomnihack-teaser-autopsy.html)

### By providing the plaintext password in the "NT Password" setting

The "NT Password" setting can contain a password. Go to Edit -> Preferences -> Protocols -> NTLMSSP. Just input the user's password in the "NT Password" field.

According to the source-code, only ASCII passwords are supported (due to the simple method for Unicode encoding). If you only have the NTLM hash: see above.