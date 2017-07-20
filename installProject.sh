#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No argument supplied, you need to pass your project name as the first argument (optional : git as second)"
    exit 1;
fi
if [ ! -f "$2" ];
  then
    echo "git repository :"
    read git
fi
project_name=$1
mkdir projects/$project_name
git clone -b develop $git "./projects/$project_name"

cd docker;
# create docker-compose.yml with proper project_name
sed -e "s/\$project/$project_name/g" dist/docker-compose.yml.dist > docker-compose.yml

# nginx conf
sed -e "s/\$project/$project_name/g" dist/project.conf > nginx/sites-available/$project_name.conf

# php-fpm conf
sed -e "s/\$project/$project_name/g" dist/project-php-fpm.conf > php-fpm/$project_name.conf
cp dist/project.ini php-fpm/$project_name.ini

bash buildAll.sh $project_name
