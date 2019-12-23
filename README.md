# Bowling

A web application for scoring bowling games.

## Installation
### Requirements
Bowling was developed using Ruby on Rails so most Rails development systems should have the necessary tools. Specifically known requirements include:
* Git
* Ruby v2+ (v2.5.3 used)
* Bundler
* Postgres

### Steps
1. Open a terminal or command line interface and `cd` to an appropriate installation directory
1. `git clone https://github.com/brucew/bowling.git`
1. `bundle`
1. `bundle exec rake db:setup`
1. `bundle exec rails server`
1. Open a web browser and point it to http://localhost:3000/

### Testing
Bowling includes a small test suite covering key functionality. To execute the tests, open a terminal or command line interface in the /bowling directory and `bundle exec rspec -f documentation`

## Usage
The first page displays an (empty) list of bowling games. Click the \[+New Game\] button to start a new bowling game. Once in the game screen, simply click the button that corresponds with the number of pins knocked down for your shot. The score will update automatically. Continue to click the button indicating the number of pins knocked down for each shot until your bowling game is complete.

You can also click the < All Games link to return to the list of saved games. From there, you may start a new game, click any completed game to review it, or click any game in progress to resume.
