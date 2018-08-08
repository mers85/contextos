class Contexts::WebscrapingController < ApplicationController
  def index
    url = params[:url]

    mechanize = Mechanize.new
    page = mechanize.get(url)
    title = ''
    page.search('h1').each do |h1|
      title = h1.text.strip
    end
    @title = title

    summary = get_from_twitter_tags(page)
    summary = get_from_property_twitter_tags(page) if summary.nil?
    summary = get_from_property_facebook_tags(page) if summary.nil?

    @summary = summary.nil? ? 'unknown': summary[:content]

  end

  private

  def get_from_twitter_tags(page)
    page.at('meta[name="twitter:description"]')
  end

  def get_from_property_twitter_tags(page)
    page.at('meta[property="twitter:description"]')
  end

  def get_from_property_facebook_tags(page)
    page.at('meta[property="og:description"]')
  end

end
