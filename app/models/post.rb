class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  
  def categories_attributes=(categories_attributes)
    categories_attributes.values.each do |v| 
      v
    end
    # byebug 
    self.categories.build(name: categories_attributes[:name])
  end

end
