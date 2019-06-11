class Procedure < ApplicationRecord
  belongs_to :studant
  has_many :portion, dependent: :destroy
end
