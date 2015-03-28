# Only clone the repo if it doesn't exist yet
# This will prevent Vagrant from overriding any existing changes
if ! [ -e ./astromo-api ]; then
  git clone git@github.com:astromo/astromo-api.git astromo-api
else
  echo -e "Already cloned astromo-api"
fi

if ! [ -e ./docker-postgresql ]; then
  git clone git@github.com:astromo/docker-postgresql.git docker-postgresql
else
  echo -e "Already cloned docker-postgresql"
fi
