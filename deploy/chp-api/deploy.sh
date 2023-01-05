#!/bin/bash

# variables 
projectName="chp-api"
namespace="chp"
# replace place_holder with values from env var
# env var's key needs to be the same as the place_holder
toReplace=('BUILD_VERSION')

# export .env values to env vars
# export $(egrep -v '^#' .env)

# printenv

# replace variables in values.yaml with env vars

for item in "${toReplace[@]}";
do
  sed -i.bak \
      -e "s/${item}/${!item}/g" \
      values.yaml
  rm values.yaml.bak
done

sed -i.bak \
    -e "s/DB_SECRET_KEY_VALUE/$DB_SECRET_KEY/g;s/APP_DJANGOALLOWEDHOSTS_VALUE/$APP_DJANGOALLOWEDHOSTS/g" \
    -e "s/DB_ENGINE_VALUE/$DB_ENGINE/g;s/DB_DATABASE_VALUE/$DB_DATABASE/g" \
    -e "s/DB_USERNAME_VALUE/$DB_USERNAME/g;s/DB_PASSWORD_VALUE/$DB_PASSWORD/g" \
    -e "s/DB_HOST_VALUE/$DB_HOST/g;s/DB_PORT_VALUE/$DB_PORT/g" \
    -e "s/DB_TYPE_VALUE/$DB_TYPE/g" \
    values-ncats.yaml
rm values-ncats.yaml.bak 

kubectl apply -f namespace.yaml

# deploy helm chart
helm -n ${namespace} upgrade --install ${projectName} -f values.ncats.yaml ./