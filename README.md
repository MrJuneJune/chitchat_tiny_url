# Local development setup

1. Create database:

       CREATE DATABSE tiny_url_development;
       CREATE DATABSE tiny_url_test;
       CREATE DATABSE tiny_url; // this one is not neccessary since no prod


1. Install gems, rake migrations, seeds sample data, annotate models if you want to read, yarn installs for webpack

        bundle
        rake db:migrate
        rake db:seed
        annoatate
        yarn install --check-files


1. Launch the server with `rails s`

1. Run tests with `rspec`

Below is what I wrote before starting working on the projects. You can read it if you want
---------------------------------------------------------------

# Grading Criteria
- It should allow users to submit a URL which will then be shortened and can be shared.
- When users click on the short URL they are redirected to the long URL.
-  Track the IP address of each visit to a URL.
- URL
  - / # home page where user can enter a URL
  - /:token # redirects to full URL
  - /:token/info # info about URL and visitor count

# Requirements
#### system
    ruby-2.7.0 0
    Rails 6.0.4.1
    node v14.17.6
    yarn 1.22.11
    postgres
#### Gems
Using postgres
- pg

Linting
- rubocop

Easier to read
- slim
- annotate

Testing
- rspec
- factory
- faker
- should_matcher

# Structure
#### Frontend
- Bootstrap

#### DB
    TokenUrl
      url, unique, not null
      token, unique, not null, auto_created , 5 length?
      timestamps, not null

    InternetProtocol
      address, not null
      token_url_id, fk
      timestamp, not null

#### Controller
Probably only need one

    # TinyUrlsController
     new '/'
       makes ajax call to create
       show errors
     create '/tiny_url' post
       return json with error or redirect urls
     show '/:token'
       redirect to the page
     index '/:token/info'
       show all ip address and url info? (title value? or just number of hits I guess?)
