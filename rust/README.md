# Readme for Rust

From https://forge.rust-lang.org/infra/other-installation-methods.html#standalone-installers

## Download 


download both files for x86_64-unknown-linux-gnu
* tar.xz
* tar.xz.asc

Import the Rust signing key.  You only need to do this once.  The Rust signing key is
available from Keybase.  You can import into your GPG keyring using the command:

```sh
gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys 0x1A7488B4688941A4E7A166A8446B000676443685
```

This command fetches the key from a public key server and adds it to your local keyring.

## Verify the signature. 

After importing the key, you can verify the signature of your downloaded installer and
its file:

```sh
gpg --verify rust-1.79.0-x86_64-unknown-linux-gnu.tar.xz.asc rust-1.79.0-x86_64-unknown-linux-gnu.tar.xz
```

The Ubuntu keyserver is generally reliable, but it can be flaky. Try using a different keyserver to download the key. A good alternative is keys.openpgp.org or pgp.mit.edu.

```sh
gpg --keyserver hkps://keys.openpgp.org --recv-keys 0x1A7488B4688941A4E7A166A8446B000676443685
# or
gpg --keyserver hkps://pgp.mit.edu --recv-keys 0x1A7488B4688941A4E7A166A8446B000676443685
# or
gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x1A7488B4688941A4E7A166A8446B000676443685
```

Didn't work.  

Go to https://keyserver.ubuntu.com/
Search for 0x1A7488B4688941A4E7A166A8446B000676443685
Download and save as rust.gpg
Transfer the rust.gpg file to home directory on HPC.

Import the key locally

```sh
gpg --import rust.gpg
```

This will add the public key to your local keyring without needing to connect to a keyserver from the HPC itself. You can then proceed with the signature verification.

Check the proxy

```sh
export http_proxy=http://proxy.sandia.gov:80
export https_proxy=http://proxy.sandia.gov:80
```

Here is a breakdown of what each part does:

* `gpg`: This is the command for GnuPG (GNU Privacy Guard), a tool used for public key cryptography.

* `--keyserver hkps://keyserver.ubuntu.com`: This flag specifies the address of the key server you want to use. A key server is a central repository for public keys, making it easy to share and retrieve them. Using hkps:// ensures a secure, encrypted connection to the server.

* `--recv-keys`: This flag tells gpg to "receive" or download a public key.

* `0x1A7488B4688941A4E7A166A8446B000676443685`: This is the unique identifier (the key ID or fingerprint) of the specific public key you want to download. In this case, it's the official public key used by the Rust project to sign its releases.

In short, this command allows you to securely retrieve the Rust project's official
public key, which you then use to verify the authenticity and integrity of downloaded
Rust files. This is a critical security step to ensure the file you downloaded hasn't
been tampered with by a malicious third party.

The output should include a line like gpg: 
Good signature from "Rust Language (On-behalf-of Rust Release) <rust-ops@rust-lang.org>".
You may see a warning that the key is "not certified with a trusted signature."
This is normal and simply means you haven't explicitly designated this key as trusted
in your local GPG configuration.

After successfully completing these steps, you can be confident that the downloaded
file is both complete and authentic.

