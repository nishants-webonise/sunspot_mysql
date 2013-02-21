class Post < ActiveRecord::Base
  attr_accessible :content, :title
  has_many :comments, :dependent => :destroy

  searchable :auto_index => true do
    text :title
    text :content

    text :comments do
      comments.map { |comment| comment.comment }
    end
  end

  def self.search_post(query)
    @search = self.search do
      keywords query
    end
  end
end
