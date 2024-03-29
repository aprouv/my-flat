class Fourniture < ApplicationRecord
  belongs_to :room
  validates :name, presence: true, uniqueness: { scope: :room_id }
  validates :image_url, presence: true
  URL_REGEXP = /(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?/ix
  validates :image_url, format: { with: URL_REGEXP, message: 'format invalid' }
end
