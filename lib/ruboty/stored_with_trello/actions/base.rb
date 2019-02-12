require 'trello'

module Ruboty
  module StoredWithTrello
    module Actions
      class Base < Ruboty::Actions::Base
        private

        def channel_name
          @channel_name ||= message.instance_variable_get(:@original)[:channel]['name']
        end

        BOARD_NAME = 'ruboty-stored'
        def board
          board = me.boards.detect { |board| board.name == BOARD_NAME && !board.closed }
          return board unless board.nil?

          Trello::Board.create(name: BOARD_NAME)
        end

        def me
          ::Trello::Member.find('me')
        end
      end
    end
  end
end
