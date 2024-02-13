FROM node:latest

# もっと丁寧に権限を設定すべきだが、、
RUN chmod 777 /home

# container を止めないためのおまじない
ENTRYPOINT ["/home/code"]
CMD ["serve-web"]
