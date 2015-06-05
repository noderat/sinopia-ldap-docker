# Pull base image.
FROM rnbwd/node-io:1.7.1

MAINTAINER PliTeX <plitex@gmail.com>

# Sinopia Version / Path / Backup

ENV version v1.2.1

RUN git clone https://github.com/RnbWd/sinopia.git
WORKDIR /sinopia
RUN git checkout $version
RUN npm install --production

#Use my fork until PR11 https://github.com/rlidwka/sinopia-ldap/pull/11 is merged
RUN npm install --production https://github.com/plitex/sinopia-ldap.git

# Clean

RUN rm -rf .git
RUN npm cache clean

ADD config.yaml /sinopia/config.yaml

CMD ["./bin/sinopia"]

EXPOSE 4873

VOLUME /sinopia/storage
