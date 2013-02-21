class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :comment, :post_id

  after_save :reindex_parent!

  def reindex_parent!
    post.index
  end
end
