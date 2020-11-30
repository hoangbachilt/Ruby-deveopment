class Authorized < ApplicationError
	def http_status
		401
	end
end
