# osx-on-docker
Run macOS on top of Docker with near-native performance with ease

![Alt text](/screenshots/xcode.png?raw=true "Xcode")

## Requirements
- KVM
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
$ git clone https://github.com/telkomdev/osx-on-docker
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

## Mounting `hostshare` volume
- On your macOS
```shell
$ sudo -S mount_9p hostshare
```
- `hostshare` will be mounted on `/Volume/hostshare` in macOS

## Common Issues
### Error "gtk initialization failed"
- Arch Linux
``` shell
$ sudo pacman -S xorg-xhost
```
- Debian, Ubuntu, Linux Mint
```shell
$ sudo apt update \
    && sudo apt install -y x11-xserver-utils \
    && xhost +
```
- RHEL, Centos, Fedora
```shell
$ sudo yum install xorg-x11-server-utils
```

## Links & Resources
- DockerOSX: https://github.com/sickcodes/Docker-OSX
- Installing Xcode: https://github.com/RobotsAndPencils/xcodes
