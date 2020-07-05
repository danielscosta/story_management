
# Story Management

This is a ruby on rails app that creates a system of story management.

[Docker](https://www.docker.com/community-edition) is required.

### Instructions:

1. Clone this repository (you need [git](https://git-scm.com/) installed):
  
    `git clone git@github.com:danielscosta/story_management.git`

2. Setup database: 

    `docker-compose run app bundle exec rake db:setup`

3. Migrate database:

    `docker-compose run app bundle exec rails db:migrate`

    `docker-compose run test bundle exec rails db:migrate`

4. In this repository create and run the containers:
   
   `docker-compose up app`

    It will create a postgres container database and ruby container for install the ruby dependencies and start rails server on port 3000.

5. Get a bash into app container, run: 

    `docker-compose run app bash`

### Running tests:

1. Tests are stored in the `spec` folder. To run them execute:

    `docker-compose up test`