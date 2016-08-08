FROM centos:centos7

MAINTAINER David King <dsmk@bu.edu>

ENV PATCHDATE=20170805

RUN yum -y update && yum clean all

EXPOSE 80
EXPOSE 443

RUN yum -y install httpd mod_ssl \
  && yum clean all

ADD httpd-foreground /usr/bin/httpd-foreground

ADD printenv /var/www/cgi-bin/printenv

RUN chmod +x /usr/bin/httpd-foreground /var/www/cgi-bin/printenv

ENV proxy_dest http://ist-w3-content-test.bu.edu:380

# this is actually a template so we can update where we proxy the
# traffic
#
ADD http-proxy.conf.in  /etc/httpd/http-proxy.conf.in
ADD http-proxy-set.conf.in  /etc/httpd/http-proxy-set.conf.in

CMD [ "httpd-foreground" ]
