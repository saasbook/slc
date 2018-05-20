# SLC Learning Center Part 1 (Group 6)

## Dev Team Members
* Lexie Polevoi
* Juno Morey
* James Scott Truitt
* Connor Votroubek
* Dhruv Relwani

## Development Status

CodeClimate GPA Badge: <a href="https://codeclimate.com/github/junomorey/slc-app"><img src="https://codeclimate.com/github/rails/rails/badges/gpa.svg"/></a>

CodeClimate Test Coverage Badge: <a href="https://codeclimate.com/github/junomorey/slc-app/test_coverage"><img src="https://api.codeclimate.com/v1/badges/ba9e5241f42bad1abae2/test_coverage"/></a>

Travis CI Badge: <a href="https://travis-ci.org/junomorey/slc-app.svg?branch=master"><img src="https://travis-ci.org/junomorey/slc-app.svg?branch=master" /></a>

Link to deployed app on Heroku: https://slc-app.herokuapp.com/

Link to Pivotal Tracker project: https://www.pivotaltracker.com/n/projects/2117751

## Customer Information 

A brief explanation of the customer's business need that the app addresses, including a link to the customer's website:
An app to match tutors and tutees for the SLC based on time availability. SLC Website: http://slc.berkeley.edu/

## Screencast and Screenshots 

YouTube Video of Client: https://www.youtube.com/watch?v=oOvuUupD5Ds&feature=youtu.be

YouTube Video of Environment Screencast: https://www.youtube.com/watch?v=65RcD66WpG0&feature=youtu.be

YouTube Video of App Screencast: https://www.youtube.com/watch?v=Px4vfpx1MDw&feature=youtu.be

Link to App Homepage Screenshot: https://screenshot.net/34e8ohm

Link to App Writer Match Page Screenshot: https://screenshot.net/4mj4vfw

## Additional Directions

Directions to get the app running:
1) The app should be cloned from GitHub using the appropriate link: https://github.com/junomorey/slc-app
2) After installing the correct gems, run "bundle install --without production"
3) Next, if it is your first time cloaning the app "rake db:setup" to setup the database, otherwise run "rake db:reset" to reset the database
4) Run "rake db:test:prepare" to set up the test database
5) Run "rake db:seed RAILS_ENV=test" to ensure that the tests can utilize the seed file
6) To run the app locally use the command "rails server" - NOTE: if you are on Cloud9 use the command "rails s -p $PORT -b $IP" instead
7) To test functionality the seed file currently has tutor and tutee users that can be used (seeds.rb)
8) To run the cucumber files run the command "cucumber" - NOTE: sometimes you must do the command "rvm use" to use the correct ruby version 
9) To run the rspec tests run the command "bundle exec rspec"

## Future Improvements

Some future improvements for the app we discussed but were unable to implement given the time constraint include:
* Increasing security to protect student confidentiality
* Improving the algorithm to produce matches based on more student attributes besides time availability
* Adding a Writer/Tutor review system to get feedback on the quality of matches
* Building in the Google-Calendar API to allow in-app scheduling
