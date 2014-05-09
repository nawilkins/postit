module ApplicationHelper

  def post_url_format(url) #google.com
    url.starts_with?('http://www.') ? url : 'http://www.' + url
  end

  def time_format(time)
    time.strftime("%_m/%-d/%Y" + " at " + "%l:%M %P %Z")
  end
end
