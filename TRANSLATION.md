# 18xx.Games 中文汉化说明

本分支为 18xx.Games 平台添加了简体中文（zh-CN）支持，默认语言为中文，可在设置中切换回英文。

## 汉化架构

### 文件结构

```
assets/app/lib/
├── i18n.rb                  # 核心翻译模块（翻译查询、语言切换）
└── locales/
    ├── zh_cn.rb             # 简体中文翻译字典
    └── en.rb                # 英文翻译字典（原文，用于切换回英文）
```

### 设计说明

- **轻量 i18n 模块**：`Lib::I18n.t('key.subkey')` 按点号路径查询翻译
- **默认中文**：首次访问默认显示简体中文
- **语言持久化**：语言选择存储在 `localStorage`（key: `i18n_locale`）
- **降级策略**：找不到翻译 key 时返回 key 本身，便于发现遗漏

## 使用方法

### 视图中调用

在任何 Snabberb 组件中：

```ruby
class MyComponent < Snabberb::Component
  include Lib::I18n   # 引入后可直接用 t('...')

  def render
    h(:button, props, t('buttons.create'))  # => "创建"
  end
end
```

### 添加新翻译

1. 在 `assets/app/lib/locales/zh_cn.rb` 添加中文翻译
2. 在 `assets/app/lib/locales/en.rb` 添加对应英文
3. 在视图中用 `t('group.key')` 引用

### 翻译字典分组约定

| 前缀 | 用途 |
|------|------|
| `nav.*` | 导航栏链接 |
| `welcome.*` | 欢迎页、首页分组标题 |
| `buttons.*` | 通用按钮 |
| `auth.*` | 登录/注册/密码相关 |
| `create_game.*` | 创建对局页面 |
| `game.*` | 游戏内通用术语 |
| `about.*` | 关于页 |
| `flash.*` | 提示条类型 |
| `confirm.*` | 确认对话框 |
| `settings.*` | 设置页 |
| `profile.*` | 个人资料、账号设置 |

## 已汉化范围

### ✅ 已完成

- [x] i18n 基础设施搭建
- [x] 导航栏（关于/管理/个人资料/注册/登录）
- [x] 欢迎页（通知、介绍、按钮）
- [x] 首页（我的对局/新对局/进行中/已结束）
- [x] 确认对话框
- [x] 登录/注册/忘记密码/重置密码
- [x] 创建对局页面（模式选择、选项、按钮）
- [x] 关于页（简介、隐私政策、贡献者）
- [x] 游戏内主菜单（游戏/实体/地图/股市/信息/板块/表格/工具/自动）

### 🔲 待后续补充

- [ ] 个人资料设置页完整汉化（颜色、通知等高级选项）
- [ ] 游戏内操作按钮（买火车、买股票、分红等，分布在 200+ 文件中）
- [ ] 各游戏的公司名、股票名、特殊规则文本（279 个游戏变体）
- [ ] 游戏日志和提示消息
- [ ] 语言切换 UI 控件（目前默认中文，可通过 localStorage `i18n_locale` 切换）

## 技术栈备注

本项目前端使用 **Opal**（Ruby 编译为 JavaScript）+ **Snabberb**（类 React 框架），后端为 Ruby + Roda + Sequel + PostgreSQL。所有汉化工作集中在前端 `assets/app/` 目录，不影响后端逻辑。
