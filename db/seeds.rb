# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

SiteConfig.create(
  :name    => 'pickup_plan_id',
  :value   => '1',
  :comment => 'トップページのPICKUPに表示されるプランのID'
) unless SiteConfig['novelty_spec_note']

SiteConfig.create(
  :name    => 'plans_per_page',
  :value   => '20',
  :comment => 'プラン一覧の 1 ページの表示件数'
) unless SiteConfig['plans_per_page']
