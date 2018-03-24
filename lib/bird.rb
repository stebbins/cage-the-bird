require 'yaml'

class Bird
  attr_reader :client

  def initialize(config)
    begin
      data = YAML.load_file(config)
      @client = TwitterAdapter.new(data)
    rescue
      raise ArgumentError, message: config_error_message
      # Prompt a correction
    end
  end

  private

  def config_error_message
    "Something's wrong with your config.yaml file!"
  end
end
