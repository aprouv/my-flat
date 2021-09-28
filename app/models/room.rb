class Room < ApplicationRecord
  has_many :fournitures, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :banner_url, presence: true
  URL_REGEXP = /(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?/ix
  validates :banner_url, format: { with: URL_REGEXP, message: 'format invalide' }
end
