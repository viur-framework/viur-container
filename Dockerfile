FROM python:3.10.6-bullseye

RUN apt-get update

RUN pip install pipenv

RUN curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
RUN eval "$(pyenv virtualenv-init -)"
ENV PATH=/root/.pyenv/bin:$PATH

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN apt-get install apt-transport-https ca-certificates gnupg -y
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
RUN apt-get update
RUN  apt-get install google-cloud-sdk -y
RUN  apt-get install google-cloud-sdk-app-engine-python -y
RUN  apt-get install google-cloud-sdk-app-engine-python-extras -y
RUN  apt-get install google-cloud-sdk-datastore-emulator -y


RUN apt install nodejs -y
RUN apt install npm -y
RUN npm install -g n
RUN n stable


VOLUME ["/projects"]
VOLUME ["~/.config/gcloud"]
VOLUME ["~/.local/share/virtualenvs"]

# expose necessary ports to host
EXPOSE 8080 8081 8090 8091 8092 27017 27018

RUN pyenv install 3.10.6

# copy entrypoint script into container, sets env variables for pipenv
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash","entrypoint.sh"]
