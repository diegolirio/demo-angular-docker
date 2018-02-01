
path="."
#$environment=$1
environment="prod"
#registry="p4go-devops.southindia.cloudapp.azure.com:5000"
registry="registry.phoenix4go.com"
#version=$2
version="0.0.1"
app="demo-angular-docker"
docker_image=$registry"/"$app":"$version

echo "#### clean dist directory, for a new build ####"
rm ./dist/* -rf

echo "#### building project ####"
echo "#### ng build --env=${environment} --aot false --base-href /demo-angular-docker/ ####"
ng build --env=${environment} --aot false --base-href /demo-angular-docker/

if [ $1 = "build" ] || [ $2 = "build" ];
then
    echo "#### build complete ####"
    echo "#### build docker image ####"
    echo "#### docker build -t \"${registry}/$app:${version}\" ${path} ####"
    docker build -t "${registry}/$app:${version}" ${path}

    if [ $# > 1] || [ $1 = "push" ] || [ $2 = "push" ];
    then
        echo "#### build complete ####"
        echo "#### push docker image ${registry} ####"
        echo "#### docker push \"${registry}/$app:${version}\" ####"
        docker push "${registry}/$app:${version}"
        echo "#### push complete ####"
    fi
fi

echo "....done..."