urls = [
 "https://3.141592653589793238462643383279502884197169399375105820974944592.eu/",
 "http://llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch.co.uk/",
]

urls.each do | url |
  TokenUrl.create(url: url)
end

TokenUrl.all.each do | token_url |
  10.times do
    token_url.internet_protocols.create(address: Faker::Internet.public_ip_v4_address)
  end
end
