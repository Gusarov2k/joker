# frozen_string_literal: true

require 'open-uri'

class ParseJokes
  include Interactor

  def call
    jokes = []
    2.upto(50).each do |page|
      list_jokes = Nokogiri::HTML(URI.open("https://www.anekdot.ru/release/anekdot/year/2022/#{page}"))
      list_jokes_second = Nokogiri::HTML(URI.open("https://www.anekdot.ru/release/anekdot/year/2021/#{page}"))

      list_jokes.search('.topicbox .text').each { |element| jokes.push(element.text) }
      list_jokes_second.search('.topicbox .text').each { |element| jokes.push(element.text) }

      break if jokes.size >= 7200
    end

    context.jokes = jokes
  end
end
