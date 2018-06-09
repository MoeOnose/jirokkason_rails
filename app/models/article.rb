class Article < ApplicationRecord
	has_one :favorite

	# def favorited_by?(user)
	# 	favorites.where(user_id: user.id).exists?
	# end
end
