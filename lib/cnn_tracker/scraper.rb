class CNNHeadlines::Scraper

  def self.news
    doc = Nokogiri::HTML(open('https://www.cnn.com/search/?size=10&q=breaking%20news'))

    breaking_news = doc.css('div.cnn-search__results-list div.cnn-search__result-contents')
    breaking_news.each do |info|

      headlines = CNNHeadlines::Breaking.new
      headlines.title = info.css('h3.cnn-search__result-headline').text
      headlines.url = "https://www.cnn.com/search/?size=10&q=breaking%20news#{info.css("a").attribute("href").value}"
      headlines.save
    end
  end
