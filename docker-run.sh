container_name="demo-ng-docker"

docker rm -f $container_name

sh ./docker.sh build

docker run -itd --name $container_name -p 4200:4200 registry.phoenix4go.com/demo-angular-docker:0.0.1