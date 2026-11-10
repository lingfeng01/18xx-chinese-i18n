# frozen_string_literal: true

require 'user_manager'
require 'view/form'

module View
  class Reset < Form
    include UserManager
    include Lib::I18n

    def render_content
      title = t('auth.reset_title')
      inputs = [
        render_input(t('auth.email'), id: :email, type: :email, attrs: { autocomplete: 'email' }),
        render_input(t('profile.temporary_password'), id: :hash, type: :password, attrs: { autocomplete: 'temp-password' }),
        render_input(t('auth.new_password'), id: :password, type: :password, attrs: { autocomplete: 'new-password' }),
        turnstile_widget,
        h(:div, [render_button(t('auth.reset_title')) { submit }]),
      ]
      render_form(title, inputs)
    end

    def submit
      reset(params)
      reset_turnstile
    end
  end
end
