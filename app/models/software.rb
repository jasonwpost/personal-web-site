class Software < ActiveRecord::Base
	validates :name,  presence: true
	VALID_SCRIPT_REGEX = /[.]{1}/
	validates :script, presence: true, format: { with: VALID_SCRIPT_REGEX }, uniqueness: true

end
