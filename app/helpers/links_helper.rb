require 'embedly'
require 'json'

module LinksHelper

  def display(url)
    embedly_api = Embedly::API.new(key: ENV['EB_KEY'])
    obj = embedly_api.oembed :url => url, width
    # obj = embedly_api.extract :url => url
    # (obj.first.html).html_safe
    (obj.first.html).html_safe
    # raise JSON.pretty_generate(obj[0].marshal_dump)
  end
end
