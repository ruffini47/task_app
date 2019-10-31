module ApplicationHelper
  require "uri"

  def full_title(page_name = "")
    base_title = "Task App"
    if page_name.empty?
      base_title
    else
      page_name + " | " + base_title
    end
  end
  
  def text_url_to_link(text)
    URI.extract(text, ["http","https"]).uniq.each do |url|
      text.gsub!(url, "<a href=\"#{url}\" target=\"_blank\">#{url}</a>")
    end
    text
  end
  
end