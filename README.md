# Getting SQLite to work on AWS lambda

## Install amazon linux container

- [Get Docker](https://www.docker.com/get-started)
- [Get amazon linux container](https://docs.aws.amazon.com/AmazonECR/latest/userguide/amazon_linux_container_image.html)

## Build this Dockerfile

Must be executed from this directory, or with an absolute path reference instead of a relative one.

`docker build . -t=sqlite-lambda`

You should see the image tagged sqlite-lambda in your docker images.

`docker images`

In order to connect to the container with a shell, and mount your desktop as a volume.

`docker run -it -v ~/Desktop/:/host-desktop sqlite-lambda /bin/bash`

In the container:
Change your working directory to the lambda (important for weird lambda .zip expectations)

`cd /sqlite-lambda-dist/`

Zip the contents to your desktop.
`zip -r /host-desktop/built-sqlite-lambda.zip *`

## Misc Docker Admin

List containers

`docker ps -a`

Stop running containers

`docker stop %container id%`

Remove stopped container

`docker rm %container id%`

View Images
`docker images`

Remove specific image

`docker rmi`

Remove unlinked images

`docker images prune`