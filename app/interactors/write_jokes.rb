# frozen_string_literal: true

class WriteJokes
  include Interactor

  before do
    context.fail! error: I18n.t('messages.empty_jokes') if context.jokes.nil? || context.jokes.empty?
  end

  def call
    if context.jokes.size >= 7200
      first_element = 0

      0.upto(1439).each do |time_mark|
        break if first_element >= context.jokes.size || (first_element + 4) >= context.jokes.size

        context.jokes[first_element..first_element + 4].each do |joke|
          Joke.create(story: joke, minute_mark: time_mark)
        end

        first_element += 5
      end
    end
  end
end
