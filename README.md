# pass-injector

"Inject" pass.
The effect is to install 'pass' by creating a script that invokes pass (via docker).
You invoke pass by `pass` but behind the scenes it runs `docker run --interactive --tty --rm emorymerryman/pass: ...`.

## Usage

The only thing you need is docker.

### Create a shell script
```
BIN=$(docker volume create) &&
docker run -it --rm --volume ${BIN}:/root/bin --volume /var/run/docker.sock:/var/run/docker.sock:ro emorymerryman/pass-injector:0.1.0
```

### Injecting the shell script into a container

```
docker run -it --rm --volume ${BIN}:/root/bin:ro --volume /var/run/docker.sock:/var/run/docker.sock:ro alpine:3.4 sh
```

### Using the injected shell script
In the newly created container:
```
apk update &&
apk upgrade &&
apk add docker &&
/root/bin/pass
```
