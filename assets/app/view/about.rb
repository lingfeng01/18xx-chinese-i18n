# frozen_string_literal: true

# backtick_javascript: true

require 'user_manager'

module View
  class About < Snabberb::Component
    include UserManager
    include Lib::I18n

    needs :needs_consent, default: false
    needs :connection, store: true, default: nil

    def render
      @connection&.get('/version.json', '/assets') do |version|
        version_localtime = Time.at(version['version_epochtime'].to_i)
        link = node_to_s(h(:a, { attrs: { href: version['url'] } }, version['hash']))
        `document.getElementById('version').innerHTML = #{link}`
        `document.getElementById('version_localtime').innerHTML = #{version_localtime}`
      end

      message = if Lib::I18n.zh_cn?
        <<~MESSAGE_ZH
          <h2>关于 18xx.Games</h2>

          <p>
          18xx.Games 由 Toby Mao 创建并维护。这是一个开源项目，源代码可在
          <a href='https://github.com/tobymao/18xx'>GitHub</a> 上获取。所有游戏均已获得版权方授权使用。更多游戏信息请访问 <a href='https://github.com/tobymao/18xx/wiki'>项目维基</a>。
          </p>

          <p>当前版本：<span id='version'>未知</span>，部署于 <span id='version_localtime'>未知</span>（<a href="https://github.com/tobymao/18xx/commits/master">查看最近提交</a>）</p>

          <h2>社区行为准则</h2>

          <p>
          友善待人，互相尊重。
          </p>

          <h2>隐私政策</h2>

          <p>
          在您同意的前提下，我们收集以下数据以提供服务。您可随时要求停止服务并删除数据。
          </p>

          <p>
          <b>邮箱地址</b> 用于发送通知。您可在#{@user ? "<a href=\"/profile/#{@user['id']}\">个人资料</a>" : '个人资料'}页面中关闭通知。邮箱不会公开，除开启邮件通知外不会分享给第三方。邮件通过 <a href='https://elasticemail.com'>Elastic Email</a> 服务发送。
          </p>

          <p>
          <b>IP 地址</b> 在您使用本站点时收集，用于防止恶意行为。不会公开，也不会分享给第三方。
          </p>

          <p>
          <b>对局数据</b> 在您进行游戏时产生，是游戏运行所必需的。对局数据通过网站界面和 API 公开可见。游戏内消息仅对局内玩家可见。
          </p>

          <p>
          <b>本地存储</b> 用于保存热座对局等本地数据，仅您的设备可访问。
          </p>

          <p>
          如有疑问或请求，请在 <a href='https://github.com/tobymao/18xx/issues'>GitHub</a> 上提交 Issue。
          </p>

          <H2>特别感谢所有贡献者。</H2>
          <a href='https://github.com/michaeljb'>michaeljb</a>
          <a href='https://github.com/jenf'>jenf</a>
          <a href='https://github.com/yzemaze'>yzemaze</a>
          <a href='https://github.com/dfannius'>dfannius</a>
          <a href='https://github.com/kelsin'>kelsin</a>
          <a href='https://github.com/talbatross'>talbatross</a>
          <a href='https://github.com/scottredracecar'>scottredracecar</a>
          <a href='https://github.com/perwestling'>perwestling</a>
          <a href='https://github.com/roseundy'>roseundy</a>
          <a href='https://github.com/ryandriskel'>ryandriskel</a>
          <a href='https://github.com/crericha'>crericha</a>
          <a href='https://github.com/ventusignis'>ventusignis</a>
          <a href='https://github.com/tysen'>tysen</a>
          <a href='https://github.com/daniel-sousa-me'>daniel-sousa-me</a>
          <a href='https://github.com/benjaminxscott'>benjaminxscott (dstar)</a>
          <a href='https://github.com/philcampeau'>philcampeau</a>

          <p>本站将始终保持开源、免费游玩。如您愿意支持本项目，可在
          <a href='https://www.patreon.com/18xxgames'>Patreon</a> 上成为赞助者。</p>
        MESSAGE_ZH
      else
        <<~MESSAGE_EN
          <h2>About 18xx.Games</h2>

          <p>
          18xx.Games is created and maintained by Toby Mao. It is an open source project, and you can find the
          code on <a href='https://github.com/tobymao/18xx/issues'>GitHub</a>. All games are used with express written consent from their respective rights holders. You can find more information about the games on the <a href='https://github.com/tobymao/18xx/wiki'>wiki</a>.
          </p>

          <p>Current version: <span id='version'>unknown</span> deployed at <span id='version_localtime'>unknown</span> (<a href="https://github.com/tobymao/18xx/commits/master">View all recent commits</a>)</p>

          <h2>Conduct Expectations</h2>

          <p>
          Be nice. Treat people with respect.
          </p>

          <h2>Privacy Policy</h2>

          <p>
          Upon your request and expression of consent, we collect the following data for the purpose of providing services to you. It is removed upon your request to terminate these services.
          </p>

          <p>
          <b>Email Addresses</b> are collected in order to send notifications. These notifications can be disabled in the #{@user ? "<a href=\"/profile/#{@user['id']}\">profile</a>" : 'profile'} page. Emails are not publicly available and not shared to any 3rd party except when email notifications are enabled. Emails are sent using the <a href='https://elasticemail.com'>Elastic Email</a> service.
          </p>

          <p>
          <b>IP Addresses</b> are collected when you use the site in order to prevent malicious behavior. These are not publicly available and not shared to any 3rd party.
          </p>

          <p>
          <b>Game Data</b> is collected when you play a game and is needed for the game to function. Game Data is publicly available through the website interface and API. In-game messages are only visible to the players in the game (whether via the website or the API).
          </p>

          <p>
          <b>Local Storage</b> is used to store local data like hot seat games and master mode. This can only be accessed by your device.
          </p>

          <p>
          For questions or requests please file an issue on <a href='https://github.com/tobymao/18xx/issues'>GitHub</a>.
          </p>

          <H2>Special thanks to all the contributors.</H2>
          <a href='https://github.com/michaeljb'>michaeljb</a>
          <a href='https://github.com/jenf'>jenf</a>
          <a href='https://github.com/yzemaze'>yzemaze</a>
          <a href='https://github.com/dfannius'>dfannius</a>
          <a href='https://github.com/kelsin'>kelsin</a>
          <a href='https://github.com/talbatross'>talbatross</a>
          <a href='https://github.com/scottredracecar'>scottredracecar</a>
          <a href='https://github.com/perwestling'>perwestling</a>
          <a href='https://github.com/roseundy'>roseundy</a>
          <a href='https://github.com/ryandriskel'>ryandriskel</a>
          <a href='https://github.com/crericha'>crericha</a>
          <a href='https://github.com/ventusignis'>ventusignis</a>
          <a href='https://github.com/tysen'>tysen</a>
          <a href='https://github.com/daniel-sousa-me'>daniel-sousa-me</a>
          <a href='https://github.com/benjaminxscott'>benjaminxscott (dstar)</a>
          <a href='https://github.com/philcampeau'>philcampeau</a>

          <p>This website will always be open-source and free to play. If you'd like support this project, you can become a patron on
          <a href='https://www.patreon.com/18xxgames'>Patreon</a>.</p>
        MESSAGE_EN
      end

      children = [h(:div, props: { innerHTML: message })]

      if @needs_consent
        @confirmation = h(:input, attrs: { placeholder: 'Type DELETE to confirm' })

        children << h(:div, [
          h(:h2, '继续使用账号前，请同意隐私政策'),
          h(:button, { on: { click: -> { consent } } }, '我同意隐私政策'),
          h(:button, { on: { click: -> { delete } } }, '删除我的账号及所有数据'),
          @confirmation,
        ])
      end

      h('div#about', children)
    end

    def consent
      edit_user(consent: true)
      store(:app_route, '/')
    end

    def delete
      return store(:flash_opts, 'Confirmation not correct') if Native(@confirmation).elm.value != 'DELETE'

      delete_user
    end
  end
end
