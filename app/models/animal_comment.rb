class AnimalComment < ApplicationRecord
  belongs_to :user
  belongs_to :animal

  validates :comment, presence: true

end
