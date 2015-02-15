# Ruby on Rails backend for Smawg


## Installing

```
sudo apt-get remove ruby1.9.1
sudo apt-get install ruby2.2 ruby2.2-dev libsqlite3-dev
ruby --version
sudo gem install bundle
bundle install
```

## Upgrading

```
bin/rake db:drop
bin/rake db:migrate
```
