# README

**To run this application:**
1. docker-compose build   
2. docker-compose up  
3. in your browser navigate to [docker-machine ip]:3000

Note that the fake user data is only requested when the root action recieves its first GET request. So the page may take a while to load first time round.

**To run tests**
- docker-compose run web rspec
