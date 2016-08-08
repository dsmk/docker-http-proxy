#!/bin/sh
#
# Remove existing proxys
#
stop_and_remove () {
  docker kill "$1"
  docker rm "$1"
}

stop_and_remove content-test
stop_and_remove wpapp-test
stop_and_remove wpasset-test
stop_and_remove phpbin-test
stop_and_remove dbin-test
stop_and_remove django-test

