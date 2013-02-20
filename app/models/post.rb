class Post < ActiveRecord::Base
  attr_accessible :content, :title

  searchable do
    text :title
    text :content
  end

  def self.search_post(query)
    @search = self.search do
      keywords query
    end
  end
end
