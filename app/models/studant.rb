class Studant < ApplicationRecord
	has_many :procedure
	has_many :schedule

	validates :name, presence: true
	validates :cpf, presence: true
	validates :fone, presence: true
end
