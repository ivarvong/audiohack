echo "Creating backup ..."
heroku pg:backups capture --app audiohack

echo " ----- "
echo "Downloading backup ..."
curl -o ./prod_db/production-latest.dump `heroku pg:backups public-url --app audiohack`

# echo " ----- "
# echo "rake db:reset ..."
# bundle exec rake db:reset

echo " ----- "
echo "Restoring backup to audiohack_development"
/Applications/Postgres.app/Contents/Versions/9.3/bin/pg_restore --verbose --clean --no-acl --no-owner -h localhost -U `whoami` -d audiohack_development ./prod_db/production-latest.dump
