.PHONY: build up down logs migrate superuser shell

BACKEND_IMAGE = nxttrendzz-backend
FRONTEND_IMAGE = nxttrendzz-frontend

build:
	docker compose build
up:
	docker compose up -d --build
down:
	docker compose down
logs:
	docker compose logs -f backend
migrate:
	docker compose exec backend python manage.py migrate
superuser:
	docker compose exec backend python manage.py createsuperuser
shell:
	docker compose exec backend bash

DOCKER_ID = lakshman1707
IMAGE_NAME_BACKEND = nxttrendzz-backend
IMAGE_NAME_FRONTEND = nxttrendzz-frontend
VERSION = v1
LATEST = latest

push:
	docker tag $(IMAGE_NAME_BACKEND) $(DOCKER_ID)/$(IMAGE_NAME_BACKEND):$(VERSION)
	docker tag $(IMAGE_NAME_BACKEND) $(DOCKER_ID)/$(IMAGE_NAME_BACKEND):$(LATEST)
	docker push $(DOCKER_ID)/$(IMAGE_NAME_BACKEND):$(VERSION)
	docker push $(DOCKER_ID)/$(IMAGE_NAME_BACKEND):$(LATEST)

	docker tag $(IMAGE_NAME_FRONTEND) $(DOCKER_ID)/$(IMAGE_NAME_FRONTEND):$(VERSION)
	docker tag $(IMAGE_NAME_FRONTEND) $(DOCKER_ID)/$(IMAGE_NAME_FRONTEND):$(LATEST)
	docker push $(DOCKER_ID)/$(IMAGE_NAME_FRONTEND):$(VERSION)
	docker push $(DOCKER_ID)/$(IMAGE_NAME_FRONTEND):$(LATEST)