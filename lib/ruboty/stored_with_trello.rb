require "ruboty/stored_with_trello/version"
require "ruboty/handlers/stored_with_trello"
require 'trello'

Trello.configure do |config|
  config.developer_public_key = ENV['TRELLO_KEY']
  config.member_token = ENV['TRELLO_MEMBER_TOKEN']
end
