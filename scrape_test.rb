require 'HTTParty'
require 'Nokogiri'
require "Pry"
require 'JSON'
require 'csv'

page = HTTParty.get('https://en.wikipedia.org/wiki/List_of_dog_breeds_recognized_by_the_American_Kennel_Club', :verify => false)

parse_page = Nokogiri::HTML(page)

dogs = {}
parse_page.css("#mw-content-text > ul").each do |group|
  group.css('li a').each do |dog|
    dogs[dog.text] = dog['href']
  end
end

Pry.start(binding)

# parse_page.css("#mw-content-text > ul").each {|group| puts group.css('li a').text}

# parse_page.css("#mw-content-text").css("ul")[2].css('li')[0].text
# => "Affenpinscher, Toy"

# parse_page.css("#mw-content-text").css("ul")[2].css('li a')[0]['href']
# => "/wiki/Affenpinscher"

# parse_page.css("#mw-content-text").css("ul")[2].css('li a')[0].text
# => "Affenpinscher"