require 'pry'
class CNNBreakingNews::Scraper

  def self.blog_scraper
    doc = Nokogiri::HTML(open('https://www.brookings.edu/'))

    blog_list = doc.css('.post-count-3')
    blog_list.collect do |info|

      blog_post = CNNBreakingNews::Blog.new
      blog_post.title = info.css('h4.title').text
      blog_post.url = "https://www.brookings.edu/#{info.css('a').attr('href').value}"
      blog_post.save
    end
  end




  #   blog_posts = doc.css('.post-count-3')
  #   blog_posts.collect do |info|
  #     CNNBreakingNews::Blog.create({
  #       title: info.css('h4.title').text,
  #       url: 'https://www.brookings.edu/' + info.css('title a').attribute['href'].value
  #       })
  #   end
  # end

  def self.expand_post(input)
    doc = Nokogiri::HTML(open(blog_post.url))
    blog_post.story = doc.css('p').text
  end
end
