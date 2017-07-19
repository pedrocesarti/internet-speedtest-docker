# Run docker-compose
compose:
	@docker-compose up -d docker-compose.yml

## Run minikube
minikube:
	@bash -x minikube/minikube.sh

## Run haproxy
haproxy:
	@bash -x minikube/haproxy.sh

## Run minikube & haproxy
run:
	@bash -x minikube/run.sh

help:
	@printf "Available targets:\n\n"
	@awk '/^[a-zA-Z\-\_0-9%:\\]+:/ { \
	  helpMessage = match(lastLine, /^## (.*)/); \
	  if (helpMessage) { \
	    helpCommand = $$1; \
	    helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
      gsub("\\\\", "", helpCommand); \
      gsub(":+$$", "", helpCommand); \
	    printf "  \x1b[32;01m%-35s\x1b[0m %s\n", helpCommand, helpMessage; \
	  } \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST) | sort -u
	@printf "\n"