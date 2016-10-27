class Review < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :chef
  validates :recipe_id, presence: true
  validates :chef_id, presence: true
  validates :title, presence: true, length: { minimum: 2, maximum: 50 }
  validates :body, presence: true, length: { minimum: 10, maximum: 300 }
end