#! /bin/bash -el

if [ -z "$DRONE_ADMIN" ]
then
  echo "DRONE_ADMIN is a required string value. Please enter it now:"
  read DRONE_ADMIN
  export DRONE_ADMIN
fi

if [ -z "$DRONE_GITHUB_CLIENT_ID" ]
then
  echo "DRONE_GITHUB_CLIENT_ID is a required string value. Please enter it now:"
  read DRONE_GITHUB_CLIENT_ID
  export DRONE_GITHUB_CLIENT_ID
fi

if [ -z "$DRONE_GITHUB_CLIENT_SECRET" ]
then
  echo "DRONE_GITHUB_CLIENT_SECRET is a required string value. Please enter it now:"
  read DRONE_GITHUB_CLIENT_SECRET
  export DRONE_GITHUB_CLIENT_SECRET
fi

if [ -z "$RELAY_KEY" ]
then
  echo "RELAY_KEY is a required string value. Please enter it now:"
  read RELAY_KEY
  export RELAY_KEY
fi

if [ -z "$RELAY_SECRET" ]
then
  echo "RELAY_SECRET is a required string value. Please enter it now:"
  read RELAY_SECRET
  export RELAY_SECRET
fi

if [ -z "$RELAY_HOST" ]
then
  echo "RELAY_HOST is a required string value. Please enter it now:"
  read RELAY_HOST
  export RELAY_HOST
fi

export DRONE_RPC_SECRET=$(openssl rand -hex 16)
export COMPOSE_CONVERT_WINDOWS_PATHS=1

docker-compose up --force-recreate --detach
relay connect --host "$RELAY_HOST" http://localhost
