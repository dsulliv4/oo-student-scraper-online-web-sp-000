require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = Nokogiri::HTML(open(index_url))
    students_array = []
    students.css("div.roster-cards-container").map do |student|
    student.css("
  end


  end

  def self.scrape_profile_page(profile_url)
    def self.scrape_profile_page(profile_slug)
      student = {}
      profile_page = Nokogiri::HTML(open(profile_slug))
      links = profile_page.css(".social-icon-container").children.css("a").map { |el| el.attribute('href').value}
      links.each do |link|
        if link.include?("linkedin")
          student[:linkedin] = link
        elsif link.include?("github")
          student[:github] = link
        elsif link.include?("twitter")
          student[:twitter] = link
        else
          student[:blog] = link
        end
      end
  end

  student[:profile_quote] = profile_page.css(".profile-quote").text if profile_page.css(".profile-quote")
     student[:bio] = profile_page.css("div.bio-content.content-holder div.description-holder p").text if profile_page.css("div.bio-content.content-holder div.description-holder p")

     student
   end
