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
require 'rails_helper'

RSpec.describe TokenUrl, type: :model do
  # Association test
  it { should have_many(:internet_protocols).dependent(:destroy) }

  # Validation tests 
  it { should validate_presence_of(:url) }

  it "Invalid URL validations" do
    token_url = build_stubbed(:token_url, url: nil)
    expect(token_url).to_not be_valid
  end

  it "Valid URL validations" do
    token_url = build_stubbed(:token_url)
    expect(token_url).to be_valid
  end

  # couldn't use `it { should validate_uniqueness_of(:token) }` 
  # as it return sql validation error saying url is null
  it "can not have two same token" do
    token_url = create(:token_url)
    non_valid_token_url = build_stubbed(:token_url, token: token_url.token)
    expect(non_valid_token_url).to_not be_valid
  end
end
