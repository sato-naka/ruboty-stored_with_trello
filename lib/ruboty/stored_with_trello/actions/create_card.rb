require 'ruboty/stored_with_trello/actions/base'

module Ruboty
  module StoredWithTrello
    module Actions
      class CreateCard < Base
        def call
          card = create_card(message[:text])

          message.reply("create card: #{card.url}")
        end

        def create_card(text)
          messages = text.split(' ')
          if messages.size > 1
            Trello::Card.create(
              list_id: list(messages.first).id,
              name: messages.last
            )
          else
            Trello::Card.create(
              list_id: list.id,
              name: messages.first
            )
          end
        end

        def list(list_name = channel_name)
          list = board.lists.detect { |list| list.name == list_name && !list.closed }
          return list if list.present?

          Trello::List.create(board_id: board.id, name: list_name)
        end
      end
    end
  end
end
