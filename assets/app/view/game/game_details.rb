# frozen_string_literal: true

require 'game_manager'
require 'lib/profile_link'

module View
  module Game
    class GameDetails < Snabberb::Component
      include GameManager
      include Lib::ProfileLink
      include Lib::I18n

      def render
        h('div.margined', [
          h(:h3, t('game.panel.details_title')),
          *render_game_info,
        ])
      end

      def format_time(ts)
        return '' unless ts

        t = Time.at(ts.to_i)
        # Fallback for non-unix timestamps (e.g. used for hotseat games)
        return ts.to_s if t.year < 2000

        t > Time.now - 82_800 ? t.strftime('%T') : t.strftime('%F')
      end

      def info_row(label, value)
        h(:p, "#{label}: #{value}")
      end

      def host_display(user)
        return '' unless user
        return h(:span, user['name']) unless user['id'].to_i.positive?

        profile_link(user['id'], user['name'])
      end

      def render_game_info
        user = @game_data['user']
        desc = @game_data['description']
        [
          (info_row(t('game.panel.description'), desc) unless desc.to_s.empty?),
          h(:p, [t('game.panel.host'), ': ', host_display(user)]),
          info_row(t('game.panel.created'), format_time(@game_data['created_at'])),
          info_row(t('game.panel.last_updated'), format_time(@game_data['updated_at'])),
        ].compact
      end
    end
  end
end
