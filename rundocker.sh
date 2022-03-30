echo -n "path to projects: "
read -e projectspath
docker run --rm --name viurdevcontainer -p 8080:8080  -p 8081:8081  -p 8090:8090 -p 8091:8091 -p 8092:8092 -p 27017:27017 -p 27018:27018 -v $projectspath:/projects \
-v $HOME/.config/gcloud:/root/.config/gcloud -ti viur-container:latest
