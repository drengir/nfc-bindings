FROM arm32v7/debian:stretch-slim 
COPY qemu-arm-static /usr/bin
LABEL maintainer=vikings<containersolutions@mobi.ch>
WORKDIR /usr/src/app

RUN \
  echo "deb-src http://deb.debian.org/debian stretch main" >> /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y --no-install-recommends install apt-utils bash python3 python3-dev python3-pip wget zip gcc autoconf automake libtool pkg-config make cmake usbutils unzip python3-setuptools swig libusb-dev && \
  wget https://github.com/xantares/nfc-bindings/archive/master.zip && \
  wget https://github.com/nfc-tools/libnfc/archive/libnfc-1.7.1.tar.gz && \
  unzip master.zip && \
  tar xvfz libnfc-1.7.1.tar.gz && \
  sh -c "echo /usr/local/lib > /etc/ld.so.conf.d/usr-local-lib.conf" && \
  ldconfig