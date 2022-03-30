# viur-container

docker build -t viur-container .

docker run -it viur-container:latest

cd viur-site

pipenv install -r deploy/requirements.txt 

pipenv install

pipenv run viur run

