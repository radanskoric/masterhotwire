docker-compose -f .devcontainer/docker-compose.yml run app bin/bridgetown db:migrate
docker-compose -f .devcontainer/docker-compose.yml up
