# mediawiki


The testing is performed on a centos vm created in azure.

First install docker on the virtual machine by the following commands:

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo yum install /path/to/downloaded/docker.rpm


start the docker :
sudo systemctl start docker

create the directory structure as follows:

project/
│
├── Dockerfile
├── entrypoint.sh
├── mariadb.sh
├── configuredb.sh
├── mediawiki.sh


copy the content as it is pasted in the files:

build the image

docker build -t ashu3456 .

![image](https://github.com/ashu3097/mediawiki/assets/143991896/b10110dc-d1c1-472b-987f-9a80e3c2034c)


create a inbound rule in the nsg in azure to allow the connectivity:

![image](https://github.com/ashu3097/mediawiki/assets/143991896/3ee76b9a-8eb3-44f5-babc-c7c426c48c21)

push the image to docker hub by using the docker-cli

docker login

docker tag ashu3456 ashuop/ashu3456

 docker push ashuop/ashu3456:latest


 ![image](https://github.com/ashu3097/mediawiki/assets/143991896/597b5c6e-d379-4daf-a388-08b7f747c0a5)







