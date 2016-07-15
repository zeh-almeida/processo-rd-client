# Client for Resultados Digitais Test
Test for Resultados Digitais

Sources for design material:
http://codepen.io/junrillg/full/xJtyf/
http://startbootstrap.com/template-overviews/clean-blog/

This project runs on Ruby 2.2.4 and Rails 4.2.6
It uses PostgreSQL Database.

In order to run this project locally:
* You'll need a `.env` file with the following entries:
* `RDS_USERNAME` for the DB User;
* `RDS_PASSWORD` for the DB User's password;
* `RDS_DB_NAME` for the DB name;
* `RDS_HOSTNAME` for the DB address;
* `RDS_PORT` for the DB port;
* `LOGENTRIES_KEY` for logging purposes;
* `COOKIE_ENDPOINT` API address to send all the user's navigation data;
* `COOKIE_API_KEY` API key to send data via the `COOKIE_ENDPOINT` entry;

After setrting up the `.env` file in the main directory, all that's left is:
* `bundle exec bundle install` to have all the GEM files installed;
* `bundle exec rake db:create db:migrate` to set up the DB;
* `bundle exec rails server -p 3001` to run the local server.
It should use port 3001 as the default port 3000 is used by the server.
