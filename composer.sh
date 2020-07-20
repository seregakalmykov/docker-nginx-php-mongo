COMMAND=$@
cd ./docker
docker exec -t myapp_php composer $COMMAND