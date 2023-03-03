# osx-on-docker
Run macOS on top of Docker with near-native performance with ease

## Requirements
- Docker
- docker-compose or Docker compose plugin
- X11

## List of supported macOS variant
- Ventura  [34Gi]
- Monterey [?Gi]
- Big Sur  [?Gi]

## How to use it?
- Clone this repository
```shell
$ git clone https://github.com/lutfailham96/osx-on-docker
```
- Choose macOS variant, ex: ventura
```shell
$ export variant="ventura" \
    && cd osx-on-docker \
    && cd ${variant} \
    && ./run.sh
```
- The script will automatically download macOS base image & run it in qemu

## Default username & password
- username: admin
- password: letmein
