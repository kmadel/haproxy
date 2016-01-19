FROM alpine:3.3

# Install Haproxy.
RUN apk add --no-cache \
    haproxy \
    && rm -rf /etc/haproxy/haproxy.cfg

# Add files.
COPY haproxy.cfg /etc/haproxy/haproxy.cfg

# Define default command.
CMD [ "/usr/sbin/haproxy", "-f", "/etc/haproxy/haproxy.cfg", "-db" ]

# Expose ports.
EXPOSE 80
EXPOSE 443
EXPOSE 9000
