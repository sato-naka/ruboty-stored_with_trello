require 'ruboty/stored_with_trello/actions/create_card'
require 'ruboty/stored_with_trello/actions/open_url'

module Ruboty
  module Handlers
    class StoredWithTrello < Base
      on /memo (?<text>.+)/, name: 'create_card', description: 'create card in trello'
      on /show board\z/, name: 'open_url', description: 'show stored board url'

      env :TRELLO_KEY, "trello key"
      env :TRELLO_MEMBER_TOKEN, "trello member token"

      def create_card(message)
        Ruboty::StoredWithTrello::Actions::CreateCard.new(message).call
      end

      def open_url(message)
        Ruboty::StoredWithTrello::Actions::OpenUrl.new(message).call
      end
    end
  end
end
