FROM node:0.12

RUN apt-get update && \
  npm install -g pm2 && \
  mkdir -p /opt/app/simple && npm install npm -g

#RUN npm install -g n; n 0.12.0
#RUN npm install -g npm@2.5.1

WORKDIR /opt/app/simple

ADD simplejsserver.js /opt/app/simple/simplejsserver.js
EXPOSE 3000
VOLUME ["/opt/app/simple"]


CMD pm2 start simplejsserver.js -l /opt/app/simple/logs/simple -i 0 && pm2 logs