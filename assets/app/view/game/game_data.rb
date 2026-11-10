# frozen_string_literal: true

# backtick_javascript: true

require 'game_manager'

module View
  module Game
    class GameData < Snabberb::Component
      include GameManager
      include Lib::I18n

      needs :allow_clone, default: true
      needs :allow_delete, default: false
      needs :show_json, default: false, store: true
      needs :actions

      def render
        @game_data = @game_data.merge(actions: @actions)
        @json = `JSON.stringify(#{@game_data.to_n}, null, 2)`

        props = {
          style: {
            whiteSpace: 'pre-wrap',
          },
        }

        children = [render_game_data_buttons]
        children << @json if @show_json
        h(:div, props, children)
      end

      def render_game_data_buttons
        clone_game = lambda do
          @connection.unsubscribe(url(@game_data))
          store(:game, nil, skip: true)
          create_hotseat(**@game_data, description: t('game.panel.cloned_from', id: @game_data[:id]))
        end

        copy_data = lambda do
          `navigator.clipboard.writeText(self.json)`

          store(
            :flash_opts,
            { message: t('game.panel.copied_data'), color: 'lightgreen' },
            skip: false,
          )
        end

        buttons = [
          h(:h3, t('game.panel.data_title')),
          h(:button, {
              on: { click: -> { store(:show_json, !@show_json) } },
              style: { width: '4.2rem' },
            },
            (@show_json ? t('game.common.hide') : t('game.common.show')).to_s),
          h(:button, { on: { click: copy_data } }, t('game.panel.copy')),
          h('a.button_link', {
              attrs: {
                href: "data:text/plain;charset=utf-8,#{`encodeURI(self.json)`}",
                download: "#{@game_data[:id]}.json",
              },
            }, t('game.panel.download')),
        ]

        if @allow_delete
          delete_game = lambda do
            delete_game(@game_data)
            store(:app_route, '/')
          end

          buttons << h(:button, { on: { click: delete_game } }, t('game.panel.delete_game'))
        end

        if @allow_clone
          buttons << h(:button, { on: { click: clone_game }, style: { marginRight: '0.3rem' } }, t('game.panel.clone_game'))
          buttons << h(:label, t('game.panel.clone_hint'))
        end

        buttons.concat(render_random_seed)

        h('div.margined', buttons)
      end

      def render_random_seed
        return [] unless (@seed = @game_data.dig('settings', 'seed'))

        copy_seed = lambda do
          `navigator.clipboard.writeText(self.seed)`
          store(
            :flash_opts,
            { message: t('game.panel.copied_seed', seed: @seed), color: 'lightgreen' },
            skip: false,
          )
        end
        [
          h(:br),
          h(:button, { on: { click: copy_seed } }, t('game.panel.copy_seed')),
          h(:a, { attrs: { href: 'https://github.com/tobymao/18xx/wiki/Random-Seeds', target: '_blank' } },
            t('game.panel.more_info_seeds')),
        ]
      end
    end
  end
end
