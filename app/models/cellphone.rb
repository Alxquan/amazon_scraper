class Cellphone < ApplicationRecord
  validates_presence_of :name, :picture_url
  validates_uniqueness_of :name
end
