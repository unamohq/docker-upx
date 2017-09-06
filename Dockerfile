FROM debian:stretch

ADD https://github.com/upx/upx/releases/download/v3.93/upx-3.93-amd64_linux.tar.xz /usr/local

RUN apt-get update && apt-get install -y xz-utils && \
    xz -d -c /usr/local/upx-3.93-amd64_linux.tar.xz | tar -xOf - upx-3.93-amd64_linux/upx > /bin/upx && \
    chmod a+x /bin/upx

ENTRYPOINT ["/bin/upx"]
