class Category < ActiveRecord::Base
  include Sluggable
  
  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :name, presence: true, length: {minimum: 3}, uniqueness: true

  before_save :generate_slug

  def to_param
    self.slug
  end
end