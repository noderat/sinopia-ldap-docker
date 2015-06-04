# Pull base image.
FROM rnbwd/node-io:1.7.1

MAINTAINER RnbWd <plitex@gmail.com>

# Sinopia Version / Path / Backup

ENV version v1.2.1

RUN git clone https://github.com/RnbWd/sinopia.git
WORKDIR /sinopia
RUN git checkout $version
RUN npm install --production
RUN npm install sinopia-ldap

# Clean

RUN rm -rf .git
RUN npm cache clean

ADD config.yaml /sinopia/config.yaml

CMD ["./bin/sinopia"]

EXPOSE 4873

VOLUME /sinopia/storage
