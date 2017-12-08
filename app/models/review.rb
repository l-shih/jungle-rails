class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :rating, presence: true, inclusion: { in: (0..5) } 
end
