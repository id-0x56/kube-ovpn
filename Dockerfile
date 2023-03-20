FROM alpine:latest

RUN apk update \
    && apk add --no-cache iptables openvpn easy-rsa \
    #
    && mkdir -p /etc/openvpn/easy-rsa \
    && cd /etc/openvpn/easy-rsa \
    #
    && mkdir -p /var/log/openvpn/ \
    && touch /var/log/openvpn/openvpn-status.log \
    #
    && ln -s /usr/share/easy-rsa/easyrsa /usr/bin/easyrsa \
    && easyrsa init-pki \
    && easyrsa gen-dh

WORKDIR /etc/openvpn

EXPOSE 1194/udp

# docker builder prune -af \
#     && docker system prune -af \
#     && docker volume prune -f \
#     && docker image prune -af

# docker login
# docker build --no-cache -t 00x56/kubernetes-openvpn:latest .
# docker push 00x56/kubernetes-openvpn:latest
