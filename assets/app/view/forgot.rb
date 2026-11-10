# frozen_string_literal: true

require 'user_manager'
require 'view/form'

module View
  class Forgot < Form
    include UserManager
    include Lib::I18n

    def render_content
      title = t('auth.forgot_title')
      inputs = [
        render_input(t('auth.email'), id: :email, type: :email, attrs: { autocomplete: 'email' }),
        turnstile_widget,
        h(:div, [render_button(t('auth.send_reset')) { submit }]),
      ]
      render_form(title, inputs)
    end

    def submit
      forgot(params)
      reset_turnstile
    end
  end
end
