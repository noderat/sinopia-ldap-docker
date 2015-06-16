## Sinopia (Docker Image)

[Sinopia](https://github.com/plitex/sinopia) is a private npm repository server.

This repo uses [master](https://github.com/plitex/sinopia) branch with a minor modification to lib/index.js which allows a trust proxy for an nginx container. The maintained repo can be found [here](https://github.com/plitex/sinopia)

Using with iojs v1.7.1 - let me know if there's any issues with this version. The storage path is also changed in the [config.yaml](https://github.com/plitex/sinopia-ldap-docker/blob/master/config.yaml) to handle the edge case where htpasswd is installed via npm.

### Options

- To run default container on port 4873

`docker run --name sinopia-ldap -d -p 4873:4873 plitex/sinopia-ldap-docker`

- to sync storage

`docker run --name sinopia-ldap -d -p 4873:4873 -v <local-path-to-storage>:/sinopia/storage plitex/sinopia-ldap-docker`


- To attach a custom [config.yaml](https://github.com/plitex/sinopia-ldap-docker/blob/master/config.yaml)

    docker run -v <local-path-to-config>:/sinopia/config.yaml \
    -d -p 4873:4873 plitex/sinopia-ldap-docker`

- To modify config.yaml, update local config then restart

`docker restart sinopia-ldap`

### Building Custom Containers

- From github repository

```
git clone https://github.com/plitex/sinopia-ldap-docker.git
cd sinopia-ldap-docker
docker build -t sinopia-ldap .
docker run -d -p 4873:4873 sinopia-ldap
```

- Nginx support

Use [nginx-proxy](https://registry.hub.docker.com/u/rnbwd/nginx/) or [jwilder/nginx-proxy](https://registry.hub.docker.com/u/jwilder/nginx-proxy/)

After running the nginx-proxy, run the sinopia container with env var VIRTUAL_HOST

```
docker run -e VIRTUAL_HOST=foo.bar.com \
  -v <local-path-to-config>:/sinopia/config.yaml \
  --name sinopia-ldap -d -P plitex/sinopia-ldap-docker
```

## Links

* [plitex/sinopia](https://github.com/plitex/sinopia)
* [plitex/sinopia-ldap](https://github.com/plitex/sinopia-ldap)
* [nginx-proxy](https://registry.hub.docker.com/u/jwilder/nginx-proxy/)
