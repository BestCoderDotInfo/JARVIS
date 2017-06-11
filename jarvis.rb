require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'

class Jarvis
  include Capybara::DSL

  def initialize(io = STDOUT)
    Capybara.default_driver = :poltergeist
    @io = io
  end

  def scrape
    visit "https://6ftdan.com/allyourdev/2016/01/13/101-ruby-code-factoids/"

    all("article.post.type-post").each do |post|
      title = post.find("h1#post-title").text
      contents = []
    end
    Capybara.save_path = 'tmp'
    save_page("#{title.downcase.tr(' ', '_')}.html")
  end
end

Jarvis.new(STDOUT).scrape
