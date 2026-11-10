# frozen_string_literal: true

# Simplified Chinese (zh-CN) translations.
#
# Naming convention: dot-separated keys, grouped by UI section.
# When adding a new UI string, add the key here AND in en.rb.

module Lib
  module Locales
    ZH_CN = {
      # ── 导航栏 ───────────────────────────────────────────────────
      nav: {
        about: '关于',
        admin: '管理',
        profile: '个人资料',
        signup: '注册',
        login: '登录',
        logout: '退出登录',
      },

      # ── 欢迎页 / 首页 ───────────────────────────────────────────
      welcome: {
        new_game: '创建新游戏',
        tutorial: '新手教程',
        your_games: '我的对局',
        hotseat_games: '热座对局',
        new_games: '新对局',
        active_games: '进行中',
        finished_games: '已结束',
        notification_intro: '报告 Bug 或提出新功能建议',
        on_github: '前往 GitHub',
        faq: '常见问题',
        keyboard_shortcuts: '键盘快捷键',
        the_wiki: '维基百科',
      },

      # ── 通用按钮 ────────────────────────────────────────────────
      buttons: {
        create: '创建',
        cancel: '取消',
        submit: '提交',
        save: '保存',
        ok: '确定',
        close: '关闭',
        back: '返回',
        confirm: '确认',
        delete: '删除',
        edit: '编辑',
        refresh: '刷新',
        join: '加入',
        leave: '离开',
        start: '开始',
        pause: '暂停',
        continue: '继续',
      },

      # ── 用户认证 ────────────────────────────────────────────────
      auth: {
        username: '用户名',
        email: '邮箱',
        password: '密码',
        confirm_password: '确认密码',
        login_title: '登录',
        signup_title: '注册账号',
        forgot_title: '忘记密码',
        reset_title: '重置密码',
        remember_me: '记住我',
        no_account: '还没有账号？',
        have_account: '已有账号？',
        forgot_password: '忘记密码？',
        sign_in: '登 录',
        sign_up: '注 册',
        sign_out: '退出登录',
        send_reset: '发送重置邮件',
        new_password: '新密码',
      },

      # ── 创建游戏 ────────────────────────────────────────────────
      create_game: {
        title: '创建新对局',
        game_title: '对局名称',
        game_options: '对局选项',
        invite_only: '仅邀请加入',
        description: '对局描述',
        players: '玩家人数',
        min_players: '最少玩家数',
        max_players: '最多玩家数',
        optional_rules: '可选规则',
        select_game: '选择游戏',
        select_variant: '选择变体',
        hotseat: '热座模式',
        multiplayer: '多人在线',
        async: '异步对局',
        turn_timer: '回合计时',
        unpassworded: '无密码',
        seed: '随机种子',
        random_seed: '随机种子',
        paste_json: '粘贴 JSON 对局数据或上传文件。',
        upload_file: '上传文件',
      },

      # ── 游戏内 ─────────────────────────────────────────────────
      game: {
        your_turn: '轮到你了',
        not_your_turn: '等待中',
        bank: '银行',
        market: '股市',
        shares: '股份',
        treasury: '库存',
        cash: '现金',
        trains: '火车',
        companies: '公司',
        corporation: '公司',
        president: '总裁',
        phase: '阶段',
        turn: '回合',
        operating_round: '运营轮',
        stock_round: '股票轮',
        dividend: '分红',
        buy_train: '购买火车',
        buy_shares: '买入股份',
        sell_shares: '卖出股份',
        pass: '跳过',
        undo: '撤销',
        message: '消息',
        chat: '聊天',
        log: '日志',
        settings: '设置',
        end_game: '结束游戏',
        resign: '认输',
      },

      # ── 关于页 ──────────────────────────────────────────────────
      about: {
        title: '关于',
        intro: '18xx.Games 是一个免费开源的 18xx 系列桌游在线对战平台。',
        contributors: '贡献者',
        license: '开源协议',
      },

      # ── 提示条 / 确认框 ─────────────────────────────────────────
      flash: {
        error: '错误',
        warning: '警告',
        info: '提示',
        success: '成功',
      },

      confirm: {
        are_you_sure: '确定吗？',
        yes: '是',
        no: '否',
      },

      # ── 设置 ────────────────────────────────────────────────────
      settings: {
        language: '语言 / Language',
        chinese: '简体中文',
        english: 'English',
      },

      # ── 个人资料 / 设置 ────────────────────────────────────────
      profile: {
        not_logged_in: '您尚未登录',
        already_logged_in: '您已登录',
        your: '您的',
        statistics: '战绩统计',
        active_games: '进行中的对局',
        finished_games: '已结束的对局',
        settings: '个人资料设置',
        display: '显示',
        notifications: '通知设置',
        default_options: '默认对局选项',
        save_changes: '保存修改',
        reset_defaults: '恢复默认',
        logout: '退出登录',
        delete_account: '删除账号及所有数据',
        confirm_password: '输入密码以确认',
        change_password: '修改密码',
        current_password: '当前密码',
        new_password: '新密码',
        confirm_new_password: '确认新密码',
        red_logo: '红色 18xx.games 标志',
        show_stats: '在个人主页显示个人战绩',
        game: '游戏',
        elo: 'Elo 积分',
        plays: '对局次数',
        no_games: '暂无符合条件的对局',
        updated_daily: '* 每日更新，仅统计已完成的对局。',
        filter_by_title: '（按游戏筛选...）',
        filter_games: '筛选对局：',
        reset: '重置',
        webhook: 'Webhook',
        webhook_url: 'Webhook 地址',
        webhook_user_id: 'Webhook 用户 ID',
        send_test: '发送测试通知',
        learn_notifications: '了解通知功能',
        turn_notifications: '回合/消息通知',
        async: '异步',
        live: '实时',
        invite_only: '仅邀请对局',
        auto_routing: '自动路由',
        default_options_hint: '此处设置将作为您创建新多人对局时的默认选项。',
        map_colors: '地图与板块颜色',
        route_colors: '路线、火车与玩家颜色',
        color: '颜色',
        width: '宽度',
        dash: '虚线',
        resend_verify: '重新发送验证邮件',
        email_or_username: '邮箱或用户名',
        create_account: '创建账号',
        temporary_password: '临时密码',
      },
    }.freeze
  end
end
