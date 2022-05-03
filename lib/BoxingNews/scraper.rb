#require 'pry'
class BoxingNews::Scraper
    @doc = Nokogiri::HTML(open("https://www.espn.com.au/boxing/"))

        def self.scrape_stories
        self.scrape_espn_headline
        self.scrape_next_espn_story
        self.scrape_another_espn_story
        # go to espn, find the defined porperties, instantiate stories
        end

         def self.scrape_espn_headline
        # 1
         story = BoxingNews::Stories.new

        story.title = @doc.css("section.headlineStack__listContainer li").first.text
        story.description = "Visit ESPN's Boxing Homepage for more information! \nhttps://www.espn.com.au/boxing/" if @description == nil
        story.description = @doc.css("div.contentItem__titleWrapper p").first.text
        story.author = "ESPN" if @author == nil
        story.author = @doc.css("span.contentMeta__author").first.text
        story.timestamp = "Less than a week ago.." if @timestamp == nil
        story.timestamp = @doc.css("div.contentItem__contentMeta.contentItem__contentMeta--bottom span.contentMeta__timestamp").first.text
        story.url = "Visit ESPN's Boxing Homepage for more information! \nhttps://www.espn.com.au/boxing/" if @url == nil
        story.url = "https://espn.com" + @doc.css("section.contentItem__content.contentItem__content--fullWidth.contentItem__content--enhanced.contentItem__content--hero.has-image.contentItem__content--story a[href]")[0]['href']
       # binding.pry
        end
        # author timestamp <div class="contentItem__contentMeta contentItem__contentMeta--bottom">
        #/html/body/div[5]/section/section/div/section[2]/section[1]/section[1]/a/div/div[4]/span[2]
        #//*[@id="news-feed"]/section[1]/section[1]/a/div/div[4]/span[2]
        ##news-feed > section.contentItem.contentItem--collection.contentCollection--hero >#starthere#>section.contentItem__content.contentItem__content--fullWidth.contentItem__content--enhanced.contentItem__content--hero.has-image.contentItem__content--story

        #<section class="contentItem__content contentItem__content--fullWidth contentItem__content--enhanced contentItem__content--hero has-image contentItem__content--story"><a name="&amp;lpos=boxing:feed:1:story" data-id="33388619" href="" 
        #class="contentItem__padding watch-link" data-component="default" data-section=":feed"><div class="contentItem__contentWrapper contentItem__contentWrapper--videoCaption">
        #<section class="contentItem__content contentItem__content--fullWidth contentItem__content--enhanced contentItem__content--hero has-image contentItem__content--story"><a name="&amp;lpos=boxing:feed:1:story" data-id="33388619" href="
       def self.scrape_next_espn_story
           story = BoxingNews::Stories.new

           story.title = @doc.css("h1.contentItem__title.contentItem__title--story")[1].text
           story.description = "Visit ESPN's Boxing Homepage for more information! \nhttps://www.espn.com.au/boxing/" if @description == nil
           story.description = @doc.css("p.contentItem__subhead.contentItem__subhead--story")[1].text
           story.author = "ESPN" if @author == nil
           story.author = @doc.css("span.contentMeta__author")[1].text
           story.timestamp = "Less than a week ago.." if @timestamp == nil
           story.timestamp = @doc.css("span.contentMeta__timestamp")[1].text
           story.url = "Visit ESPN's Boxing Homepage for more information! \nhttps://www.espn.com.au/boxing/" if @url == nil
           story.url = "https://espn.com" + @doc.css("section.contentItem__content.contentItem__content--story.has-image.has-video.contentItem__content--collection a[href]")[0]['href']

            #<div class="contentItem__contentWrapper"><div class="contentItem__titleWrapper">
            #<h1 class="contentItem__title contentItem__title--story" data-mptype="story">

            #<<div class="contentItem__contentWrapper"><div class="contentItem__titleWrapper">
            #<p class="contentItem__subhead contentItem__subhead--story">

            #<div class="contentItem__contentMeta contentItem__contentMeta--bottom">
            #<span class="contentMeta__timestamp">3d</span>
            #<span class="contentMeta__author">Mike Coppinger and Nick Parkinson</span></div>

                                                    #<section class="contentItem__content contentItem__content--story has-image has-video contentItem__content--collection"><a " href="
        end
        #binding.pry

        #bin/BoxingNews

        def self.scrape_another_espn_story
            # 1
             story = BoxingNews::Stories.new
    
            story.title = @doc.css("h1.contentItem__title.contentItem__title--story")[2].text
            story.description = "Visit ESPN's Boxing Homepage for more information! \nhttps://www.espn.com.au/boxing/" if @description == nil
            story.description = @doc.css("p.contentItem__subhead.contentItem__subhead--story")[2].text
            story.author = "ESPN" if @author == nil
            story.author = @doc.css("span.contentMeta__author")[2].text
            story.timestamp = "About a week ago.." if @timestamp == nil
            story.timestamp = @doc.css("span.contentMeta__timestamp")[2].text
            story.url = "Visit ESPN's Boxing Homepage for more information! \nhttps://www.espn.com.au/boxing/" if @url == nil
            story.url = "https://espn.com" + @doc.css("section.contentItem__content.contentItem__content--story.has-image.has-video.contentItem__content--collection a[href]")[1]['href']
           # binding.pry
            end
    end


#bin/BoxingNews