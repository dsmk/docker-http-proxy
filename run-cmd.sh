#!/bin/bash -x
#
# command to run/create a docker container with our special parameters
#
docker_image="http-proxy"
host_header="www-test.bu.edu"
   # -e host_header="$host_header" \

# proxy_host name local_port dest
#
proxy_http_host () {
  docker run \
    -d \
    -e proxy_dest="$3" \
    -e host_header="$host_header" \
    -p "$2:80" \
    --name="$1" \
    "$docker_image"
}

proxy_http_host content-test 18080 "http://ist-w3-content-test01.bu.edu:381"
proxy_http_host wpapp-test 18081 "http://ist-wp-app-test01.bu.edu:80"
proxy_http_host wpasset-test 18082 "http://ist-wp-app-test01.bu.edu:930"
proxy_http_host phpbin-test 18083 "http://phpbin-test.bu.edu:181"
proxy_http_host dbin-test 18084 "http://dbin-test.bu.edu:181"
proxy_http_host django-test 18085 "http://vsc66.bu.edu:116"

#  -v "$extprefix/logs:/opt/shibboleth-idp/logs" \
