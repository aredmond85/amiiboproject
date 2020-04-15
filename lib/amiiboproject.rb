#require 'pry'
require 'httparty'

require_relative "amiiboproject/version"
require_relative "amiiboproject/cli"
require_relative "amiiboproject/api_manager"
require_relative "amiiboproject/amiibo"

module Amiiboproject
  class Error < StandardError; end
  # Your code goes here...
end
