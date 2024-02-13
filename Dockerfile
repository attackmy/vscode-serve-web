FROM node:latest

ENV APP_ROOT=/home
ENV HOME=${APP_ROOT}
WORKDIR ${APP_ROOT}

# もっと丁寧に権限を設定すべきだが、、
RUN chmod 777 ${APP_ROOT}
ADD code code
RUN chmod 777 code

# container を止めないためのおまじない
ENTRYPOINT ["code"]
CMD ["serve-web"]
