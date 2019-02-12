require 'ruboty/stored_with_trello/actions/base'

module Ruboty
  module StoredWithTrello
    module Actions
      class OpenUrl < Base
        def call
          message.reply("board url: #{board.url}")
        end
      end
    end
  end
end
