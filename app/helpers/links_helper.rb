require 'embedly'
require 'json'

module LinksHelper

  def display(url)
    embedly_api = Embedly::API.new(key: ENV['EB_KEY'])

    obj = embedly_api.oembed :url => url
    if obj.first.type == "video"
      raise (obj.first.html).html_safe
    elsif obj.first.type == "photo"
      clean_url = obj.first.url.sub(/([?]fb)+$/, '')
      raise %Q{ <p><img src="#{clean_url}" alt="#{obj.first.title}"style="width:100%"></p> }.html_safe
    else
      %Q{ <p><img src="http://i.imgur.com/B7jmNAw.png" alt="not found" style="width:100%"></p> }.html_safe
    end

    # obj = embedly_api.oembed :url => url
    # puts obj[0].marshal_dump
    # json_obj = JSON.pretty_generate(obj[0].marshal_dump)
    # puts json_obj
  end

  def title(url)
    embedly_api = Embedly::API.new(key: ENV['EB_KEY'])

    obj = embedly_api.oembed :url => url
    (obj.first.title).html_safe
  end

  def thumbnail(url)
    # should be more efficient to store the thumbnail 65x65 instead of retrieving the whole file
    embedly_api = Embedly::API.new(key: ENV['EB_KEY'])

    obj = embedly_api.oembed :url => url
    if obj.first.type != "error"
      %Q{ <img class="media-object" src="#{obj.first.thumbnail_url+"?meow"}" alt="#{obj.first.title}" style="width:64px;height:64px;"> }.html_safe
    else
      %Q{ <img class="media-object" src="http://i.imgur.com/B7jmNAw.png" alt="not found" style="width:64px;height:64px;"> }.html_safe
    end

  end
end
