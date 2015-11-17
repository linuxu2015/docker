# Redis Dockerfile
#
# https://github.com/dockerfile/redis
#

# Pull base image.
FROM ubuntu:14.04
MAINTAINER op <op@aioute.com>

# Install Redis.
RUN apt-get update
RUN apt-get -y install make gcc
ADD redis-stable.tar.gz /tmp

RUN \
  cd /tmp && \
  cd redis-stable && \
  make && \
  make install && \
  mkdir -p /var/redis/log && \
  touch /var/redis/log/redis.log && \
  cp -f src/redis-sentinel /usr/local/bin && \
  mkdir -p /etc/redis && \
  cp -f sentinel.conf /etc/redis && \
  rm -rf /tmp/redis-stable*

COPY redis.conf /etc/redis/

# Expose ports.
EXPOSE 6379

# Define default command.
CMD ["redis-server", "/etc/redis/redis.conf"]
