FROM debian:stable-slim
MAINTAINER Sven Fischer <sven@leiderfischer.de>

ARG DEBIAN_FRONTEND=noninteractive
ARG REPO=http://cdn-fastly.deb.debian.org

RUN apt-get update --yes \
    && apt-get install --no-install-recommends --yes \
    build-essential git wget libssl-dev ca-certificates \
    && git clone https://github.com/catalinii/minisatip.git \
    && cd minisatip/ \
    && ./configure \
    && make \
    && apt-get clean --yes


FROM debian:stable-slim
WORKDIR /root/
COPY --from=0 /minisatip/minisatip .

RUN apt-get update --yes \
    && apt-get install --no-install-recommends --yes \
    wget libssl1.1 \
    && apt-get clean --yes

# Install Sundtek DVB Driver
RUN wget http://www.sundtek.de/media/sundtek_netinst.sh \
  && chmod 755 sundtek_netinst.sh \
  && ./sundtek_netinst.sh -easyvdr \
  && rm -f ./sundtek_netinst.sh

ADD entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh

# Default container settings
EXPOSE 8875 554 1900/udp
ENTRYPOINT ["/entrypoint.sh"]