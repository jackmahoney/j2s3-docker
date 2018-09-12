FROM maven:3.5.4-jdk-10-slim

# install python3 and j2s3-cli
RUN apt-get update
RUN apt-get install -y python3-pip
RUN pip3 -I j2s3-cli==1.1.1

# install swagger codegen cli
RUN apt-get install wget
RUN wget http://central.maven.org/maven2/io/swagger/swagger-codegen-cli/2.3.1/swagger-codegen-cli-2.3.1.jar -O /usr/bin/swagger-codegen-cli.jar
RUN echo -e '#!/usr/bin/env sh\njava -jar /usr/bin/swagger-codegen-cli.jar "$@"' | tee --append /usr/bin/swagger-codegen
RUN chmod a+x /usr/bin/swagger-codegen

# install docker
RUN apt-get install unzip
RUN wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
RUN unzip terraform_0.11.8_linux_amd64.zip
RUN mv terraform /usr/local/bin/
