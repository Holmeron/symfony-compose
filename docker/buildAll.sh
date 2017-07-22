#!/bin/bash
project_name=$1
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ${DIR} \
&& echo '//////////////////// BUILDING APP Image \\\\\\\\\\\\\\\\\\\\' \
&& docker build --build-arg project=$project_name -f app/Dockerfile -t $project_name/app . \
&& echo '//////////////////// BUILDING PHP-fpm Image \\\\\\\\\\\\\\\\\\\\' \
&& docker build --build-arg project=$project_name -f php-fpm/Dockerfile -t $project_name/php-fpm . \
&& echo '//////////////////// BUILDING nginx Image \\\\\\\\\\\\\\\\\\\\' \
&& docker build --build-arg project=$project_name -f nginx/Dockerfile -t $project_name/nginx . \
&& docker-compose up -d \
&& docker-compose exec php composer install \
&& cd ../projects/$project_name \
&& docker exec -it $project_name/app sh
