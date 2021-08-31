# == Schema Information
#
# Table name: token_urls
#
#  id         :bigint           not null, primary key
#  url        :string           not null
#  token      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :token_url do    
    url { Faker::Internet.domain_name(subdomain: true, domain: "example_something_long") }
  end
end
