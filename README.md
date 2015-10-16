## Sinopia

[Sinopia](https://github.com/rlidwka/sinopia) is a private npm repository server.

**Run sinopia container:**

`mkdir -p /path/to/storage`

`mkdir -p /path/to/config.yaml`

*edit config.yaml*

`docker run \
  -v /path/to/storage:/sinopia/storage \
  -v /path/to/config.yaml:/sinopia/config.yaml \
  --name sinopia -d -P aledbf/sinopia`

### Optional Usage

- To run default container on port 4873

`docker run --name sinopia -d -p 4873:4873 aledbf/sinopia`

- to sync storage

`docker run --name sinopia -d -p 4873:4873 -v <local-path-to-storage>:/storage aledbf/sinopia`

- To attach a custom config.yaml

    docker run -v <local-path-to-config>:/sinopia/config.yaml \
    -d -p 4873:4873 aledbf/sinopia`

- To modify config.yaml, update local config then restart

`docker restart sinopia`

### Building Custom Containers

- From github repository

```
git clone https://github.com/aledbf/sinopia-docker.git
cd sinopia-docker
make container
```
