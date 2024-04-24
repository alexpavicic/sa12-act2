require 'httparty'

response = HTTParty.get("https://api.github.com/users/alexpavicic/repos")

if response.code == 200
  repositories = JSON.parse(response.body)
  most_starred_repo = repositories.max_by { |repo| repo['stargazers_count'] }

  puts "Name: #{most_starred_repo['name']}"
  puts "Description: #{most_starred_repo['description'] || 'N/A'}"
  puts "Number of Stars: #{most_starred_repo['stargazers_count']}"
  puts "URL: #{most_starred_repo['html_url']}"
end

