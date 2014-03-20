class MenuItem < ActiveRecord::Base
  belongs_to :business
  default_scope -> { order('created_at DESC') }
  validates :name, presence: true, length: { maximum: 140 }
  validates :business_id, presence: true
  validates :price, presence: true,
            numericality: true,
            format: { :with => /\A\d{1,4}(\.\d{0,2})?\z/ }
end
