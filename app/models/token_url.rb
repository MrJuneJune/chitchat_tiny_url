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
class TokenUrl < ApplicationRecord
  has_many :internet_protocols, dependent: :destroy

  validates_presence_of :url
  validates_uniqueness_of :url, :token

  before_create :generate_token, unless: :token?

  def generate_token
    self.token = SecureRandom.hex(3)
    generate_token if TokenUrl.exists?(self.token)
  end
end
