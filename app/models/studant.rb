class Studant < ApplicationRecord
	has_many :procedure
	has_many :schedule
end
