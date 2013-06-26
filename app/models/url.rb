require 'uri'

class Url < ActiveRecord::Base
before_save :validate_url
# validates_format_of :url, :with => URI::regexp#(%w(http https www))
# validates_format_of :url, :with => URI::DEFAULT_PARSER.regexp[:ABS_URI]

def clicked!
    self.click_count += 1
    self.save
  end

  def validate_url
    unless url.match(/http[s]{0,1}:\/\/.*/)
      self.url = "http://" + self.url
    end
  end

end
