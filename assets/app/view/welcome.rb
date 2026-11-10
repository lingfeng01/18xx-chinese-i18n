# frozen_string_literal: true

require 'lib/publisher'

module View
  class Welcome < Snabberb::Component
    include Lib::I18n

    needs :app_route, default: nil, store: true

    def render
      children = [render_notification]
      children << render_introduction
      children << render_buttons

      h('div#welcome.half', children)
    end

    # 版本更新通知（中文 / 英文）
    def render_notification
      message = if Lib::I18n.zh_cn?
        <<~MESSAGE_ZH
          <p><a href="https://github.com/tobymao/18xx/wiki/18Junta">18Junta</a> 现已进入 Alpha 测试。</p>
          <p><a href="https://github.com/tobymao/18xx/wiki/1864-Forty-Niner">1864: Forty-Niner</a> 现已进入 Beta 测试。</p>
          <p><a href="https://github.com/tobymao/18xx/wiki/1837">1837</a> 已正式上线。</p>
          <p>发现 Bug 或建议新功能，请 <a href='https://github.com/tobymao/18xx/issues'>前往 GitHub 反馈</a>。</p>
        MESSAGE_ZH
      else
        <<~MESSAGE_EN
          <p><a href="https://github.com/tobymao/18xx/wiki/18Junta">18Junta</a> is now in alpha.</p>
          <p><a href="https://github.com/tobymao/18xx/wiki/1864-Forty-Niner">1864: Forty-Niner</a> is now in beta.</p>
          <p><a href="https://github.com/tobymao/18xx/wiki/1837">1837</a> is now in production.</p>
          <p>Report bugs and make feature requests <a href='https://github.com/tobymao/18xx/issues'>on GitHub</a>.</p>
        MESSAGE_EN
      end

      props = {
        style: {
          background: 'rgb(240, 229, 140)',
          color: 'black',
          marginBottom: '1rem',
        },
        props: {
          innerHTML: message,
        },
      }

      h('div#notification.padded', props)
    end

    # 平台介绍（中文 / 英文）
    def render_introduction
      message = if Lib::I18n.zh_cn?
        <<~INTRO_ZH
          <p>请查看 <a href='https://github.com/tobymao/18xx/wiki/FAQ'>常见问题</a>、<a href='https://github.com/tobymao/18xx/wiki/Power-User-Features'>键盘快捷键</a> 和 <a href='https://github.com/tobymao/18xx/wiki'>项目维基</a></p>
          <p>可以在聊天中寻找对局，或加入 <a href='https://github.com/tobymao/18xx/wiki/18xx-Online-Communities%2C-Media%2C-and-Resources#community'>非官方 Discord 服务器</a></p>
          <p>回合提醒可通过 <a href='https://github.com/tobymao/18xx/wiki/Notifications#discord-notifications'>Discord</a>、<a href='https://github.com/tobymao/18xx/wiki/Notifications#slack-notifications'>Slack</a> 或 <a href='https://github.com/tobymao/18xx/wiki/Notifications#telegram-notifications'>Telegram</a> 开启</p>
          <p>如有任何问题，请在 <code>#18xxgames</code> 频道 <a href='https://join.slack.com/t/18xxgames/shared_invite/zt-42uap6ff6-72R~~8khCkK08Aarwnukxw'>18XX Slack</a> 中提问</p>
          <p>从出版商处购买 18XX 实体桌游：</br> #{Lib::Publisher.link_list.join}。</p>
          <p>通过 <a href='https://www.patreon.com/18xxgames'>Patreon</a> 赞助以维持服务器运行</p>
        INTRO_ZH
      else
        <<~INTRO_EN
          <p>Check out the <a href='https://github.com/tobymao/18xx/wiki/FAQ'>FAQ</a>, <a href='https://github.com/tobymao/18xx/wiki/Power-User-Features'>keyboard shortcuts</a> and <a href='https://github.com/tobymao/18xx/wiki'>the Wiki</a></p>
          <p>Find games in the chat or <a href='https://github.com/tobymao/18xx/wiki/18xx-Online-Communities%2C-Media%2C-and-Resources#community'>on (unofficial) Discord servers</a></p>
          <p><a href='https://github.com/tobymao/18xx/wiki/Notifications'>Turn notifications</a> can be enabled via <a href='https://github.com/tobymao/18xx/wiki/Notifications#discord-notifications'>Discord</a>, <a href='https://github.com/tobymao/18xx/wiki/Notifications#slack-notifications'>Slack</a>, or <a href='https://github.com/tobymao/18xx/wiki/Notifications#telegram-notifications'>Telegram</a></p>
          <p>Ask any questions about the site in <code>#18xxgames</code> <a href='https://join.slack.com/t/18xxgames/shared_invite/zt-42uap6ff6-72R~~8khCkK08Aarwnukxw'>on the 18XX Slack</a></p>
          <p>Buy physical copies of 18XX games from publishers:</br> #{Lib::Publisher.link_list.join}.</p>
          <p>Keep the servers running by becoming a member <a href='https://www.patreon.com/18xxgames'>on Patreon</a></p>
        INTRO_EN
      end

      props = {
        style: {
          marginBottom: '1rem',
        },
        props: {
          innerHTML: message,
        },
      }

      h('div#introduction', props)
    end

    def render_buttons
      props = {
        style: {
          margin: '1rem 0',
        },
      }

      create_props = {
        on: {
          click: -> { store(:app_route, '/new_game') },
        },
      }

      tutorial_props = {
        on: {
          click: -> { store(:app_route, '/tutorial?action=1') },
        },
      }

      h('div#buttons', props, [
        h(:button, create_props, t('welcome.new_game')),
        h(:button, tutorial_props, t('welcome.tutorial')),
      ])
    end
  end
end
