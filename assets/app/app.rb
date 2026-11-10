# frozen_string_literal: true

# backtick_javascript: true

require 'engine/logger'
require 'index'
require 'game_manager'
require 'user_manager'
require 'lib/connection'
require 'lib/params'
require 'lib/settings'
require 'lib/storage'
require 'lib/i18n'
require 'view/about'
require 'view/admin'
require 'view/create_game'
require 'view/game_card_page'
require 'view/home'
require 'view/confirm'
require 'view/flash'
require 'view/game_page'
require 'view/map_page'
require 'view/market_page'
require 'view/navigation'
require 'view/tiles_page'
require 'view/user'
require 'view/forgot'
require 'view/reset'

class App < Snabberb::Component
  include GameManager
  include UserManager
  include Lib::Settings

  needs :pin, default: nil
  needs :title, default: nil
  needs :production, default: nil
  needs :keywords, default: nil
  needs :turnstile_sitekey, default: nil

  def render
    setup_logger

    props = {
      props: { id: 'app' },
      style: {
        backgroundColor: color_for(:bg) || 'inherit',
        color: color_for(:font) || 'currentColor',
        minHeight: '98vh',
        padding: '0 2vmin 2vmin 2vmin',
        transition: 'background-color 1s ease',
      },
    }

    h(:div, props, [
      h(View::Navigation),
      h(View::Flash),
      h(View::Confirm),
      render_content,
    ])
  end