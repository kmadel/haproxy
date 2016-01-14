#
# Haproxy Dockerfile
#
#

# Pull base image.
FROM debian:jessie

# Install Haproxy.
RUN apt-get update && apt-get install -y --no-install-recommends \
    haproxy

# Add files.
ADD haproxy.cfg /etc/haproxy/haproxy.cfg
ADD start.bash /haproxy-start

# Define mountable directories.
VOLUME ["/haproxy-override"]

# Define working directory.
WORKDIR /etc/haproxy

# Define default command.
CMD ["bash", "/haproxy-start"]

# Expose ports.
EXPOSE 80
EXPOSE 443
EXPOSE 9000
