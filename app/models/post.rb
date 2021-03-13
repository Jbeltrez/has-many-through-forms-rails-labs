class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  # accepts_nested_attributes_for :categories

  def categories_attributes=(categories_attributes)
    # byebug 
    
    categories_attributes.values.each do |categories_attribute|
      category = Category.find_or_create_by(categories_attribute) 
      if category.name != ""
        self.categories << category
    # byebug 
      end 
    end 
  end

end
