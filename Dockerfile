FROM node:slim
MAINTAINER Chris Coggburn <chris@coggburn.us>
RUN npm install -g npm
RUN npm install --production --global sinopia
RUN npm install --production --global sinopia-ldap
RUN npm cache clean

CMD sinopia --config /sinopia/config.yaml
EXPOSE 4873
VOLUME /sinopia/storage
