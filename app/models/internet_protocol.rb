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
class InternetProtocol < ApplicationRecord
  belongs_to :token_url

  validates_presence_of :address
end
