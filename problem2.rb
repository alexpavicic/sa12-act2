require 'httparty'

response = HTTParty.get("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")

if response.code == 200
  data = JSON.parse(response.body)
  data.sort_by! { |crypto| -crypto['market_cap'] }

  data.first(5).each_with_index do |crypto, index|
    puts "#{index + 1}. #{crypto['name']}: $#{crypto['current_price']} (Market Cap: $#{crypto['market_cap']})"
  end
end