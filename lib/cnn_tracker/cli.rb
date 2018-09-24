class CNNHeadlines::CLI

  def call
    CNNHeadlines::Scraper.news
    breaking_news
    menu
    goodbye
  end

  def breaking_news
    puts "Today's breaking news:\n\n"

    CNNHeadlines::Breaking.all.each.with_index(1) do |breaking_news, i|
      puts "#{i}. #{breaking_news.title} \n\n"
      end
    end

    def menu
    input = nil
    until input == 'exit'
      puts 'Enter the number of breaking news headlines you would like to read or type list to see all the news again or type exit:'
      input = gets.strip.downcase

      if input.to_i.between?(1, CNNHeadlines::Breaking.all.size)
        news = CNNHeadlines::Scraper.add_story(CNNHeadlines::Breaking.find(input))
        puts "Title: #{news.title}"
        puts '-------------Story----------------'
        puts breaking.story
      elsif input == 'list'
        breaking_news
      elsif input == 'exit'
        break
      else
        puts 'Please type list or exit.'
      end
    end

  end

  def goodbye
    puts "\nDon't miss the latest breaking news! Visit us again soon."
  end

end
