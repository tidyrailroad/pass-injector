# pass-injector

"Inject" pass.
The effect is to install 'pass' by creating a script that invokes pass (via docker).
You invoke pass by `pass` but behind the scenes it runs `docker run --interactive --tty --rm emorymerryman/pass: ...`.

## Usage

The only thing you need is docker.

### Create a gpg key

If you don't have a gpg key, you can generate it.

```
DOT_GNUPG=$(docker volume create) &&
docker run --interactive --tty --rm --volume ${DOT_GNUPG}:/root/.gnupg --env GPG_TTY=/dev/console emorymerryman/gpg:0.0.0 --gen-key

```

### Getting your gpg key id

```
docker run --interactive --tty --rm --volume ${DOT_GNUPG}:/root/.gnupg --env GPG_TTY=/dev/console emorymerryman/gpg:0.0.0 --list-keys
```

Look for
```
pub   rsa2048/83142483 2016-12-17 [SC]
uid         [ultimate] emory@local
sub   rsa2048/AE48E974 2016-12-17 [E]

```

### Create a shell script
```
BIN=$(docker volume create) &&
docker run --interactive --tty --rm --volume ${BIN}:/root/bin --volume /var/run/docker.sock:/var/run/docker.sock:ro emorymerryman/pass-injector:0.1.0 ${DOT_GNUPG}
```

### Injecting the shell script into a container

```
docker run -it --rm --volume ${BIN}:/usr/local/bin:ro --volume /var/run/docker.sock:/var/run/docker.sock:ro emorymerryman/strongarm:0.2.1
```

### Using the injected shell script
In the newly created container:
```
apk update &&
apk upgrade &&
apk add docker &&
/root/bin/pass
```
