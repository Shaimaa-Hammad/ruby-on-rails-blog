class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_one_attached :image, dependent: :destroy

  after_save :set_default_image

  private

  def set_default_image
    unless image.attached?
      default_image_path = Rails.root.join('app', 'assets', 'images', 'articles.png')
      image.attach(io: File.open(default_image_path), filename: 'articles.png', content_type: 'image/png')
    end
  end
end
