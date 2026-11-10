# frozen_string_literal: true

require 'game_manager'
require 'lib/storage'
require 'view/game/game_data'
require 'view/game/game_details'
require 'view/game/notepad'
require 'view/game/actionable'
require 'view/game/auto_router_settings'

module View
  module Game
    class Tools < Snabberb::Component
      include GameManager
      include Actionable
      include Lib::I18n

      needs :game, store: true
      needs :user
      needs :confirm_endgame, store: true, default: false

      def render
        @settings = Lib::Storage[@game.id] || {}
        h(:div, [
          h(Notepad),
          h(RenameHotseat),
          *render_tools,
          h(AutoRouterSettings),
          h(GameData, actions: @game.raw_actions.map(&:to_h)),
          h(GameDetails),
          *help_links,
        ])
      end

      def player_notification
        h('div.margined', [
          h(:label, t('game.tool.notification_hint')),
        ])
      end

      def master_mode
        mode = @settings[:master_mode] || false
        toggle = lambda do
          Lib::Storage[@game.id] = @settings.merge('master_mode' => !mode)
          update
        end

        h('div.margined', [
          h(:button, { on: { click: toggle } }, "#{t('game.tool.master_mode')} #{mode ? '✅' : '❌'}"),
          h(:label, mode ? t('game.tool.move_for_others') : t('game.tool.move_for_others_enable')),
        ])
      end

      def end_game
        end_game =
          if @confirm_endgame
            confirm = lambda do
              store(:confirm_endgame, false)
              player = @game.players.find { |p| p.name == @user&.dig('name') }
              process_action(Engine::Action::EndGame.new(player || @game.current_entity))
              # Go to main page
              store(:app_route, @app_route.split('#').first)
            end
            [
              h(:button, { on: { click: -> { store(:confirm_endgame, false) } }, style: { width: '7rem' } }, t('buttons.cancel')),
              h(:button, { on: { click: confirm } }, t('game.tool.confirm_end_game')),
            ]
          else
            [
              h(:button, { on: { click: -> { store(:confirm_endgame, true) } }, style: { width: '7rem' } }, t('game.end_game')),
            ]
          end

        h('div.margined', end_game)
      end

      def render_tools
        children = [player_notification, master_mode]
        children << end_game unless @game.finished
        children
      end

      def help_links
        props = {
          attrs: {
            href: 'https://github.com/tobymao/18xx/wiki/Power-User-Features#hotkeys--shortcuts',
            title: 'Open wiki: hotkeys & shortcuts',
          },
        }

        [h(:h2, t('game.tool.help')), h(:a, props, t('game.tool.hotkeys'))]
      end
    end
  end
end
