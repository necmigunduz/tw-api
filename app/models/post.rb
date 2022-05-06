class Post < ApplicationRecord
  belongs_to :user

  def self.slugify(tag)
    #strip the string
    tag.strip

    #blow away apostrophes
    tag.gsub! /['`]/,""

    # @ --> at, and & --> and
    tag.gsub! /\s*@\s*/, " at "
    tag.gsub! /\s*&\s*/, " and "

    #replace all non alphanumeric, underscore or periods with underscore
    tag.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '_'  

    #convert double underscores to single
    tag.gsub! /_+/,"_"

    #strip off leading/trailing underscore
    tag.gsub! /\A[_\.]+|[_\.]+\z/,""

    tag
  end
end
