# viur-container

## If you want to build the container by yourself

first Checkout repo:
```sh
git pull github.com/viur-framework/viur-container
```

## Then build the container:
Note that there is a dot as the last argument at the end, this points to the current working directory where the Dockerfile resides.
```sh
docker build -t viur-container .
```

## OR use the pre build Container:
```sh
docker pull ghcr.io/viur-framework/viur3-container:latest
```
## Run the Container
When starting the container for the first time, make sure you are already authenticated in gcloud. The container will use the default credentials of the host system: 
```sh
gcloud auth application-default login
```
Export the path that you want the docker container to mount, where all your projects are in. You can see in the docker run command, that we are using $projectpath for this, you can chose your own obviously.

See the docker [documentation](https://docs.docker.com/config/containers/container-networking/) for details, for viur projects we use port 8080 as default, if you have local services using this port already, you might want to expose a different port. If you are developing a frontend with Vue.js and use vite you also need to map port 8081.

```sh
export projectspath="/my/path/to/projects"

docker run --rm --name viurdevcontainer -p 8080:8080  -p 8081:8081  -p 8090:8090 -p 8091:8091 -p 8092:8092 -p 27017:27017 -p 27018:27018 -v $projectspath:/projects -v $HOME/.config/gcloud:/root/.config/gcloud -ti viur-container:latest
```
When the container has been started successfully, you can change into your specific project directory and start working.
Setup your pipenv and start your shell.
```sh
pipenv install --de
pipenv shell
viur run
```

**If you use MacOS then use this command from inside your pipenv instead**
```sh
viur run develop --port 8091 --host 0.0.0.0
```
