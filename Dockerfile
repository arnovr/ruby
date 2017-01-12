FROM ruby:2.4-onbuild

RUN apt-get update && apt-get install -y sqlite3 libsqlite3-dev

CMD ["./bin/run"]