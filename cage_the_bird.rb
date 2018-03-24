require 'yaml'
require 'require_all'
require_all 'lib'


data = YAML.load_file('config.yml')
TWITTER_CLIENT = TwitterAdapter.new(data)
