# frozen_string_literal: true

# i18n / 国际化模块
#
# 用法：
#   Lib::I18n.t('nav.about')        # => '关于'（默认中文）
#   Lib::I18n.locale = :en          # 切换到英文
#   Lib::I18n.locale                # => 当前语言符号
#
# 翻译文件：
#   assets/app/lib/locales/zh_cn.rb  （简体中文，默认）
#   assets/app/lib/locales/en.rb     （英文，原始文案）
#
# 新增文案时：
#   1. 在 zh_cn.rb 和 en.rb 中各加一条同名 key
#   2. 在视图中用 Lib::I18n.t('group.key') 替换硬编码字符串

require_relative 'locales/zh_cn'
require_relative 'locales/en'

module Lib
  module I18n
    STORAGE_KEY = 'i18n_locale'

    # 支持的语言列表
    LOCALES = {
      zh_cn: '简体中文',
      en: 'English',
    }.freeze

    # 当前语言，优先读 localStorage，默认中文
    def self.locale
      saved = Lib::Storage[STORAGE_KEY]
      (saved && LOCALES.key?(saved.to_sym)) ? saved.to_sym : :zh_cn
    end

    def self.locale=(lang)
      lang = lang.to_sym
      raise ArgumentError, "Unsupported locale: #{lang}" unless LOCALES.key?(lang)

      Lib::Storage[STORAGE_KEY] = lang.to_s
      lang
    end

    def self.zh_cn?
      locale == :zh_cn
    end

    # 根据当前语言选择翻译字典
    def self.dict
      case locale
      when :en then Locales::EN
      else Locales::ZH_CN
      end
    end

    # 点号路径查找翻译，例如 t('nav.about')
    # 找不到时返回 key 本身，便于发现遗漏的翻译
    def self.t(key)
      parts = key.to_s.split('.')
      val = dict
      parts.each do |p|
        val = val.is_a?(Hash) ? val[p.to_sym] : nil
        break if val.nil?
      end
      val.nil? ? key : val.to_s
    end

    # 简短别名，include 后可直接用 t('...')
    def t(key)
      Lib::I18n.t(key)
    end
  end
end
