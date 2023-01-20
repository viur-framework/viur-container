# viur-container

# If you want to build the container by yourself

first Checkout repo: 
git pull github.com/viur-framework/viur-container

# then Build:
docker build -t viur-container .

# OR use the pre build Container:
docker pull ghcr.io/viur-framework/viur3-container:latest

# Run the Container
read -e projectspath
docker run --rm --name viurdevcontainer -p 8080:8080  -p 8081:8081  -p 8090:8090 -p 8091:8091 -p 8092:8092 -p 27017:27017 -p 27018:27018 -v $projectspath:/projects -v $HOME/.config/gcloud:/root/.config/gcloud -ti viur-container:latest

cd viur-site

#First time Authenticate Google user: gcloud auth application-default login

pipenv install --dev

pipenv run viur run
# If you use MacOS then use this command:  viur run develop --port 8091 --host 0.0.0.0
