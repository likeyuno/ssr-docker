FROM ubuntu:18.04

MAINTAINER KallyDev kallydev@gmail.com

RUN apt update \
    && apt install -y git python

RUN git clone -b manyuser https://github.com/shadowsocksr-backup/shadowsocksr

ENV SSR_PORT="443" \
    SSR_PASSWORD="M1L3ajR3" \
    SSR_METHOD="aes-128-cfb" \
    SSR_PROTOCOL="origin" \
    SSR_OBFS="http_simple"

EXPOSE $SSR_PORT

WORKDIR shadowsocksr

CMD bash bbr.sh

CMD python shadowsocks/server.py -p $SSR_PORT -k $SSR_PASSWORD -m $SSR_METHOD -O $SSR_PROTOCOL -o $SSR_OBFS

