FROM node:latest

# OpenShiftのPermission denied対応
ENV APP_ROOT=/home/vscode
ENV HOME=${APP_ROOT}
WORKDIR ${APP_ROOT}
# もっと丁寧に権限を設定すべきだが、、
RUN chmod 777 ${APP_ROOT}
ADD code /usb/bin/code
RUN chmod 777 /usb/bin/code

# --hostを指定しないと外部からアクセスできない
ENTRYPOINT ["/usb/bin/code", "serve-web", "--accept-server-license-terms", "--host", "0.0.0.0"]
