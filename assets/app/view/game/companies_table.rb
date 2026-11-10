# frozen_string_literal: true

require 'view/game/company'

module View
  module Game
    class CompaniesTable < Snabberb::Component
      needs :game
      needs :companies, default: nil
      needs :title, default: 'Certs'

      include Lib::I18n

      def render
        display_companies = @companies.flat_map do |c|
          h(Company, company: c, layout: :table)
        end

        table_props = {
          style: {
            padding: '0 0.5rem 0.2rem',
            grid: 'auto / 1fr auto auto',
            gap: '0 0.3rem',
          },
        }

        h('div.unsold_company_table', table_props, [
          h('div.bold', @title),
          h('div.bold.right', t('game.company.value')),
          h('div.bold.right', t('game.company.income')),
          *display_companies,
        ])
      end
    end
  end
end
