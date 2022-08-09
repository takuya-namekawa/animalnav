class Animal < ApplicationRecord

  belongs_to :user
  has_many :animal_comments, dependent: :destroy

  has_many :favorites, dependent: :destroy


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  has_one_attached :profile_image

  def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no-image.png')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
  end

   with_options presence: true do
    validates :title
    validates :body
    validates :profile_image
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      @animal = Animal.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @animal = Animal.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @animal = Animal.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @animal = Animal.where("title LIKE?","%#{word}%")
    else
      @animal = Animal.all
    end
  end


end
