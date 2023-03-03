#!/usr/bin/env bash

download_qcow_image() {
  if [ ! -f "mac_hdd_ng.img" ]; then
    wget -q -O mac_hdd_ng.img
  fi
}

check_qcow_image() {
  if [ ! -f "mac_hdd_ng.img" ]; then
    echo "macOS Ventura base image does not exist"
    exit 1
  fi
  if ! file mac_hdd_ng.img  | grep -q QEMU; then
    echo "macOS Ventura base image is invalid"
    exit 1
  fi
}

run_docker() {
  echo "Running docker container ..."
  if docker-compose >/dev/null; then
    docker-compose up
  else
    docker compose up
  fi
}

download_qcow_image \
  && check_qcow_image \
  && run_docker
