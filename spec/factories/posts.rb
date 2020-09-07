require 'faker'

FactoryBot.define do
  factory :post do
    title { 'dfervfervebv' }
    content { 'wvewvwev' }
    author { Faker::Name.name }
  end
end
