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

    summary = page.at('meta[name="twitter:description"]')
    unless summary
      summary = page.at('meta[property="twitter:description"]')
    end
    summary = summary.nil? ? 'Unknow' : summary[:content]
    @summary = summary


  end
end
