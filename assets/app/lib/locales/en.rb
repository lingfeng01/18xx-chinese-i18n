# frozen_string_literal: true

# English (source) translations.
#
# This file mirrors the original hard-coded English strings. It exists so that
# a user can switch the UI back to English after defaulting to Chinese.
# Every key that exists in zh_cn.rb should also exist here.

module Lib
  module Locales
    EN = {
      # ── Navigation ──────────────────────────────────────────────
      nav: {
        about: 'About',
        admin: 'Admin',
        profile: 'Profile',
        signup: 'Signup',
        login: 'Login',
        logout: 'Logout',
      },

      # ── Welcome / Home ──────────────────────────────────────────
      welcome: {
        new_game: 'CREATE A NEW GAME',
        tutorial: 'TUTORIAL',
        your_games: 'Your Games',
        hotseat_games: 'Hotseat Games',
        new_games: 'New Games',
        active_games: 'Active Games',
        finished_games: 'Finished Games',
        notification_intro: 'Report bugs and make feature requests',
        on_github: 'on GitHub',
        faq: 'FAQ',
        keyboard_shortcuts: 'keyboard shortcuts',
        the_wiki: 'the Wiki',
      },

      # ── Buttons ──────────────────────────────────────────────────
      buttons: {
        create: 'Create',
        cancel: 'Cancel',
        submit: 'Submit',
        save: 'Save',
        ok: 'OK',
        close: 'Close',
        back: 'Back',
        confirm: 'Confirm',
        delete: 'Delete',
        edit: 'Edit',
        refresh: 'Refresh',
        join: 'Join',
        leave: 'Leave',
        start: 'Start',
        pause: 'Pause',
        continue: 'Continue',
      },

      # ── Auth ─────────────────────────────────────────────────────
      auth: {
        username: 'Username',
        email: 'Email',
        password: 'Password',
        confirm_password: 'Confirm Password',
        login_title: 'Login',
        signup_title: 'Sign Up',
        forgot_title: 'Forgot Password',
        reset_title: 'Reset Password',
        remember_me: 'Remember me',
        no_account: "Don't have an account?",
        have_account: 'Already have an account?',
        forgot_password: 'Forgot password?',
        sign_in: 'Sign In',
        sign_up: 'Sign Up',
        sign_out: 'Sign Out',
        send_reset: 'Send Reset Email',
        new_password: 'New Password',
      },

      # ── Create Game ──────────────────────────────────────────────
      create_game: {
        title: 'Create a New Game',
        game_title: 'Game Title',
        game_options: 'Game Options',
        invite_only: 'Invite only game',
        description: 'Description',
        players: 'Players',
        min_players: 'Min Players',
        max_players: 'Max Players',
        optional_rules: 'Optional Rules',
        select_game: 'Select a Game',
        select_variant: 'Select a Variant',
        hotseat: 'Hotseat',
        multiplayer: 'Multiplayer',
        async: 'Async',
        turn_timer: 'Turn Timer',
        unpassworded: 'Unpassworded',
        seed: 'Seed',
        random_seed: 'Random Seed',
        paste_json: 'Paste JSON game data or upload a file.',
        upload_file: 'Upload File',
      },

      # ─── Game in progress ──────────────────────────────────────
      game: {
        your_turn: 'Your Turn',
        not_your_turn: 'Waiting',
        bank: 'Bank',
        market: 'Market',
        shares: 'Shares',
        treasury: 'Treasury',
        cash: 'Cash',
        trains: 'Trains',
        companies: 'Companies',
        corporation: 'Corporation',
        president: 'President',
        phase: 'Phase',
        turn: 'Turn',
        operating_round: 'Operating Round',
        stock_round: 'Stock Round',
        dividend: 'Dividend',
        buy_train: 'Buy Train',
        buy_shares: 'Buy Shares',
        sell_shares: 'Sell Shares',
        pass: 'Pass',
        undo: 'Undo',
        message: 'Message',
        chat: 'Chat',
        log: 'Log',
        settings: 'Settings',
        end_game: 'End Game',
        resign: 'Resign',
      },

      # ── About / Footer ──────────────────────────────────────────
      about: {
        title: 'About',
        intro: '18xx.Games is a free, open-source website for playing 18xx games online.',
        contributors: 'Contributors',
        license: 'License',
      },

      # ── Flash / Confirm ─────────────────────────────────────────
      flash: {
        error: 'Error',
        warning: 'Warning',
        info: 'Info',
        success: 'Success',
      },

      confirm: {
        are_you_sure: 'Are you sure?',
        yes: 'Yes',
        no: 'No',
      },

      # ── Settings ─────────────────────────────────────────────────
      settings: {
        language: 'Language',
        chinese: '简体中文',
        english: 'English',
      },

      # ── Profile / Settings ────────────────────────────────────────
      profile: {
        not_logged_in: 'You are not logged in',
        already_logged_in: 'You are already logged in',
        your: 'Your',
        statistics: 'Statistics',
        active_games: 'Active Games',
        finished_games: 'Finished Games',
        settings: 'Profile Settings',
        display: 'Display',
        notifications: 'Notifications',
        default_options: 'Default Game Options',
        save_changes: 'Save Changes',
        reset_defaults: 'Reset Defaults',
        logout: 'Log Out',
        delete_account: 'Delete account and all data',
        confirm_password: 'Enter your password to confirm',
        change_password: 'Change Password',
        current_password: 'Current Password',
        new_password: 'New Password',
        confirm_new_password: 'Confirm New Password',
        red_logo: 'Red 18xx.games logo',
        show_stats: 'Show your stats on your profile',
        game: 'Game',
        elo: 'Elo',
        plays: 'Plays',
        no_games: 'No games match your filters',
        updated_daily: '* Updated daily; only finished games are counted.',
        filter_by_title: '(filter by game...)',
        filter_games: 'Filter games:',
        reset: 'Reset',
        webhook: 'Webhook',
        webhook_url: 'Webhook URL',
        webhook_user_id: 'Webhook User ID',
        send_test: 'Send test notification',
        learn_notifications: 'Learn about notifications',
        turn_notifications: 'Turn/Message notifications',
        async: 'Async',
        live: 'Live',
        invite_only: 'Invite only game',
        auto_routing: 'Auto routing',
        default_options_hint: 'These settings will be used as defaults when you create new multiplayer games.',
        map_colors: 'Map and tile colors',
        route_colors: 'Route, train and player colors',
        color: 'Color',
        width: 'Width',
        dash: 'Dash',
        resend_verify: 'Resend verification email',
        email_or_username: 'Email or username',
        create_account: 'Create Account',
        temporary_password: 'Temporary Password',
      },
    }.freeze
  end
end
