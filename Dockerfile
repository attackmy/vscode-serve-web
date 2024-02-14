FROM node:latest

ENV APP_ROOT=/home
ENV HOME=${APP_ROOT}
WORKDIR ${APP_ROOT}

# もっと丁寧に権限を設定すべきだが、、
RUN chmod 777 ${APP_ROOT}
ADD code code
RUN chmod 777 code

RUN echo '#!/bin/sh' > startup.sh
RUN echo '/home/code serve-web --accept-server-license-terms --host $(hostname -i)' >> startup.sh
RUN chmod 777 startup.sh

ENTRYPOINT ["/home/startup.sh"]
