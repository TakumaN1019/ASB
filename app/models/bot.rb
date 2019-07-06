class Bot < ApplicationRecord

  belongs_to :user
  has_many :selects, dependent: :destroy

  accepts_nested_attributes_for :selects, allow_destroy: true

end
