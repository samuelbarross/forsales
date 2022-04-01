# README

This documentation describes how to set up the application, its components, how
to deploy it, and some internal information.

## Set up
This application needs ruby version 2.6.3. The version is set at the top of the
Gemfile, in a way similar to Heroku. Most ruby version managers and Heroku
recognize this syntax and will select the right version, or ask to install it.
To find more about ruby, go [here](https://www.ruby-lang.org/es/)

This application is also based on the latest stable Rails version, which is, at
this moment, 6.0.0. To find more about Rails, go [here](http://rubyonrails.org/)

This application also depends on node.js and yarn. You need at least node.js version 8.16.0+, and
yarn version 1.x+. To learn more about how to install node.js go to [their website](https://nodejs.org/).

Start Project

    docker-compose up --build
    docker-compose exec web rails db:create
    docker-compose exec web rails db:migrate
    docker-compose exec web rails db:seed

Run tests

    docker-compose exec web rspec

Login, User test created from seed:

    email: 'teste@email.com'
    password: '12345678'

Point your browser to [http://localhost:3001/](http://localhost:3001/) and explore!
