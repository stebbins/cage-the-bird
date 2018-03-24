require 'yaml'
require 'require_all'
require_all 'lib'


data = YAML.load_file('config.yml')

def start_app(client)
  puts "Loaded #{client.username}."
  puts "What do you want to purge?"
  puts "(You can enter multiple separated by a space)"
  puts "Options: likes retweets tweets all"
  print '> '
  wranglers = gets.chomp.split
  wranglers = ['likes', 'retweets', 'tweets'] if wranglers.include?('all')
  cage = Wrangler.new(wranglers)
  puts "Loaded..."
  puts "To continue, type 'yes' without quotes."
  puts "Any other input will cancel the process."
  puts "You can press Ctrl+C during the process to terminate, as well."
  print '> '
  purge_confirmation = gets.chomp
  if purge_confirmation == 'yes'
    puts "Beginning purge, this may take a moment."
    cage.clear
    puts "Finished!"
  else
    puts "Cancelled, exiting"
  end
end

begin
  TWITTER_CLIENT = TwitterAdapter.new(data)
  start_app(TWITTER_CLIENT)
rescue ArgumentError
  puts "It looks like you need to properly configure your ./config.yml file"
  puts "with API authorization details from Twitter."
  puts "Here are the instructions for configuring your ./config.yml file:"
  puts "1. Visit 'https://apps.twitter.com/' and create a new app."
  puts "(The name, description, and website don't matter)"
  puts "2. Go to 'Keys and Access Tokens' and hit 'Create my access token'"
  puts "under the 'Your Access Token' section."
  puts "3. Create a config.yml file in this directory with your Consumer Key,"
  puts "Consumer Secret, Access Token, and Access Token Secret."
  puts "You can find an example of the format in ./example_config.yml"
  puts "4. Run ruby ./cage_the_bird.rb again!"
end
