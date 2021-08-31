# == Schema Information
#
# Table name: internet_protocols
#
#  id           :bigint           not null, primary key
#  token_url_id :bigint
#  address      :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :internet_protocol do
    association :token_url
    address { Faker::Internet.ip_v4_address }
  end
end
