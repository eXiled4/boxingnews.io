#require 'pry'
#CLI Controller
class BoxingNews::CLI 

    def call
        puts "\nWelcome to ESPN's latest stories on Boxing News!"
        BoxingNews::Scraper.scrape_stories
        list_stories
        list
    end

    def list_stories
        puts "\nLatest Stories:"
        @stories = BoxingNews::Stories.all
        @stories.each.with_index(1) do |story, x|
            puts "#{x}. '#{story.title}' by #{story.author} - #{story.timestamp}"
        end
    end

    def list
        input = nil
        while input != "exit"
            puts "\nEnter the number of the article you would like to see, type list to see the list again, or type exit to leave."
            input = gets.strip.downcase

            if input.to_i > 0 && input.to_i < 4
                the_story = @stories[input.to_i-1]
                puts "\n#{the_story.title} by #{the_story.author} - #{the_story.timestamp}"
                puts "\n#{the_story.description}" if the_story.description != nil
                if the_story.url 
                    doc = Nokogiri::HTML(open("#{the_story.url}"))
                    story = doc.css("div.article-body p").text
                    #<div class="article-body" style="min-height: 301px;"> multiple <p> - with all content
                    puts "\n"
                    puts story
                    puts "\n"
                    puts the_story.url
                else
                    puts "\nCheck out https://www.espn.com.au/boxing/ for more information!"
                end
            elsif input == 'list'
                list_stories
            elsif input == 'exit'
                goodbye
            else
                puts "\nSorry, please try again."
            end
        end
    end

    def goodbye
        puts "\nSee you tomorrow for more news!"
    end
    #binding.pry
end

#ruby lib/BoxingNews/cli.rb
#ruby bin/BoxingNews

#("section.headlineStack__listContainer li").text

#<section class="col-three"><div class="headlineStack"><header class="headlineStack__header"><h1 class="module__header"> Top Headlines</h1></header><section class="headlineStack__listContainer"><ul class="headlineStack__list"><li data-story-id="33468597" data-id="33468597"><a name="&amp;lpos=boxing:feed:1:coll:headlines:1" 

#<a name="&amp;lpos=boxing:feed:1:coll:headlines:1" href="/boxing/story/_/id/33468597/josh-taylor-jack-catterall-controversy-judge-ian-john-lewis-downgraded-scorecard" class="" data-mptype="headline">Taylor-Catterall judge downgraded for scorecard</a>