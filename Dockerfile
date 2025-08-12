FROM alpine:3.22 AS base
LABEL maintainer="Maximilian Herold herold@emjot.de"

# Install Squid and required packages
RUN apk add --no-cache \
    squid \
    tini \
    curl \
    && rm -rf /var/cache/apk/*

FROM base AS print_latest_squid_version

COPY print_latest_squid_version.sh /tools/
WORKDIR /tools
CMD ["./print_latest_squid_version.sh"]

FROM base AS main

# Create necessary directories
RUN mkdir -p /var/cache/squid /var/log/squid /etc/squid/conf.d

# Set proper permissions (using existing squid user/group)
RUN chown -R squid:squid /var/cache/squid /var/log/squid /etc/squid

# Create a wrapper script to handle logging properly
COPY squid-wrapper /usr/local/bin/squid-wrapper
RUN chmod +x /usr/local/bin/squid-wrapper

# Initialize cache directory
RUN squid -z

# Clean up any PID files from cache initialization
RUN rm -f /var/run/squid.pid

# Expose port
EXPOSE 3128

# Use tini as entrypoint for proper signal handling
ENTRYPOINT ["/sbin/tini", "--"]

# Use working wrapper script: Squid writes to log files, wrapper tails to stdout/stderr
CMD ["/usr/local/bin/squid-wrapper"]
