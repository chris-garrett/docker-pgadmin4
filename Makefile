IMAGE_VERSION=4.2-2019.03.02
IMAGE_NAME=chrisgarrett/fluentd
PGADMIN_VERSION=4.2

all: build

prep:
	VERSION=${IMAGE_VERSION} PGADMIN_VERSION=${PGADMIN_VERSION} envsubst '$${VERSION} $${PGADMIN_VERSION}' < ./templates/Dockerfile.template > Dockerfile
	VERSION=${IMAGE_VERSION} PGADMIN_VERSION=${PGADMIN_VERSION} envsubst '$${VERSION} $${PGADMIN_VERSION}' < ./templates/README.md.template > README.md

build: prep
	docker build --no-cache --rm=true -t ${IMAGE_NAME}:${IMAGE_VERSION} .

run:
	docker run -p 7091:80 -e PGADMIN_DEFAULT_EMAIL=admin@admin.com -e PGADMIN_DEFAULT_PASSWORD=admin --rm -it ${IMAGE_NAME}:${IMAGE_VERSION}

bash:
	docker run ${RUN_ARGS} bash
