Cage the Bird
=============

Cage the Bird is a simple Ruby command line application for purging the likes, retweets, and/or tweets of a Twitter account.

You have to set up a Twitter app ([link](https://apps.twitter.com/)) to give Cage the Bird authorization over your account. Cage the Bird only deletes likes, retweets, and tweets and doesn't send information or otherwise violate your privacy - feel free to delete the Twitter app after use. Please note that Cage the Bird is limited to the REST API limit outlined by Twitter's [API documentation](https://developer.twitter.com/en/docs/basics/things-every-developer-should-know).

Use
---

1. Follow instructions in [Installation](#installation) to setup Cage the Bird
2. Start Cage the Bird by running `ruby ./cage_the_bird.rb` in the project directory
3. Enter in `tweets`, `retweets`, or `likes` to purge the specified type of content. Note that you can enter in multiple selections (separated by a space, like `tweets likes`) or `all` to purge all three
4. Double-check and confirm your selection by entering `yes`
5. Allow Cage the Bird to run - it can take a while, so grab a coffee, tea, or water while you wait.

Installation
------------

1. Clone into the Cage the Bird repo and enter the project directory
2. Run `bundle install` in the project directory
3. Create a new [Twitter App](https://apps.twitter.com/) (The name, description, and website don't matter)
4. Go to 'Keys and Access Tokens' and hit 'Create my access token' under the 'Your Access Token' section
5. Create a `config.yml` file in the project directory with your Consumer Key, Consumer Secret, Access Token, and Access Token Secret (You can find an example `config.yml` file in `example_config.yml`)

Contribute
----------

Feel free to contribute to the project by forking and issuing a pull request.

Some feature ideas:
1. An ability to purge content that matches a regex that match a provided dictionary file (only purge tweets with curse words, etc)
2. An ability to purge content during a certain time period
3. "Multithreaded" purging; purge likes, retweets, and tweets simultaneously
4. Tests!

Support
-------

Simply open an issue ticket to report any problems or bugs.

License
-------

This project is licensed under the MIT license.
