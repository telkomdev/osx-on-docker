#!/usr/bin/env bash

qcow_image_url="https://telkomind-my.sharepoint.com/:u:/g/personal/dpe_dbt104_telkom_co_id/Eevymb06K9BPt1F0QjSvbLwBhYwctHwJBlz-lGlXudlmOw?download=1"

download_qcow_image() {
  if [ ! -f "mac_hdd_ng.img" ]; then
    echo "Downloading macOS Ventura base image ..."
    wget -O mac_hdd_ng.img "${qcow_image_url}"
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
  if docker-compose > /dev/null 2>&1; then
    docker-compose up
  else
    docker compose up
  fi
}

download_qcow_image \
  && check_qcow_image \
  && run_docker
