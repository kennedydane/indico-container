#!/usr/bin/env bash

#sudo -u postgres createuser ${DB_USER} --createdb && \
#sudo -u postgres createdb indico_template -O ${DB_USER} && \
#sudo -u postgres psql indico_template -c "CREATE EXTENSION unaccent; CREATE EXTENSION pg_trgm;" && \
#createdb indico -T indico_template


psql -U postgres -c "CREATE USER ${DB_USER} PASSWORD '${DB_PASS}';" && \
psql -U postgres -c "CREATE DATABASE indico_template OWNER ${DB_USER};" && \
psql -U postgres indico_template -c "CREATE EXTENSION unaccent; CREATE EXTENSION pg_trgm;" && \
psql -U postgres -c "CREATE DATABASE ${DB_NAME} TEMPLATE indico_template;"


# psql -U postgres -c "CREATE USER ${DB_USER} PASSWORD '${DB_PASS}'" && \
# psql -U postgres -c "CREATE DATABASE ${DB_NAME} OWNER ${DB_USER}" && \
# if [ -e /backup/chpcusers.dump ]; then
# 	cat /backup/chpcusers.dump | psql -U postgres ${DB_NAME}
# fi
