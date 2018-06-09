class Article < ApplicationRecord
	has_many :favorites

	def favorited_by?(session)
		self.favorites.where(session_id: session).exists?
	end
end
