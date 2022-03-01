class BoxingNews::Scraper
    @doc = Nokogiri::HTML(open("https://www.espn.com.au/boxing/"))

     def self.scrape_stories
        self.scrape_espn_headline
        # go to espn, find the defined porperties, instantiate stories
    end

    def self.scrape_espn_headline
        # 1
        story = Boxing::Stories.new

        story.title = @doc.search("div.contentItem__titleWrapper h1")[0].text
        story.description = "Visit ESPN's Boxing Homepage for more information! \nhttps://www.espn.com.au/boxing/" if @description != nil
        story.description = @doc.search("div.contentItem__titleWrapper p")[0].text
        story.author = "ESPN" if @author == nil
        story.author = @doc.search("div.contentItem__contentWrapper.contentItem__contentWrapper--videoCaption span.contentMeta__author").text
        story.timestamp = "Less than a week ago" if @timestamp == nil
        story.timestamp = @doc.search("div.contentItem__contentWrapper.contentItem__contentWrapper--videoCaption span.contentMeta__timestamp").text
        story.url = "Visit ESPN's Boxing Homepage for more information! \nhttps://www.espn.com.au/boxing/" if @url == nil
        story.url = "https://espn.com" + @doc.search("section.contentItem__content.contentItem__content--fullWidth.contentItem__content--enhanced.contentItem__content--hero.has-image.contentItem__content--story a[href]")[0]['href']
    end

end