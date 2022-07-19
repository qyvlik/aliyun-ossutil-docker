FROM alpine:3

ARG TIME_ZONE=Asia/Shanghai
ARG APK_REPOSITORIES=mirrors.aliyun.com
ARG OSSUTIL_VERSION=1.7.13

RUN sed -i "s/dl-cdn.alpinelinux.org/${APK_REPOSITORIES}/g" /etc/apk/repositories

RUN apk add --update --no-cache tzdata curl wget bash git gettext jq \
    && echo "${TIME_ZONE}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime \
    && rm -rf /var/cache/apk/*

WORKDIR /aliyun-ossutil

RUN ln -sf /dev/stdout /aliyun-ossutil/ossutil.log

RUN curl -o /usr/local/bin/ossutil "https://gosspublic.alicdn.com/ossutil/${OSSUTIL_VERSION}/ossutil64" \
    && chmod +x /usr/local/bin/ossutil
