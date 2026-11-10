# frozen_string_literal: true

require 'view/game/actionable'
require 'view/form'

module View
  module Game
    class Notepad < Form
      include Actionable
      include Lib::I18n

      def render_content
        return h(:div) if @game_data[:mode] == :hotseat || !@game.players.map(&:name).include?(@user&.dig('name'))

        notepad = render_input(
          '',
          id: :notepad,
          el: :textarea,
          attrs: {
            placeholder: t('game.panel.notepad_placeholder'),
            title: t('game.panel.notepad_hint'),
            rows: 10,
            cols: 80,
          },
          input_style: {
            width: '40rem',
            maxWidth: 'calc(96vw - 1.5rem)',
            margin: '0.5rem 0',
          },
          on: {
            change: -> { save_user_settings({ notepad: params['notepad'] }) },
          },
          children: @game_data.dig('user_settings', 'notepad')
        )

        h(:div, [
          h(:h3, t('game.panel.notepad_title')),
          notepad,
        ])
      end
    end
  end
end
