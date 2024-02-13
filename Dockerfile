FROM node:latest

# もっと丁寧に権限を設定すべきだが、、
RUN chmod 777 /home
ADD code /home/code
RUN chmod 777 /home/code

# container を止めないためのおまじない
ENTRYPOINT ["/home/code"]
CMD ["serve-web"]
