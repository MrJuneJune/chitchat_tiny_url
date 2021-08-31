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
require 'rails_helper'

RSpec.describe InternetProtocol, type: :model do
  # Association test
  it { should belong_to(:token_url) }
end
