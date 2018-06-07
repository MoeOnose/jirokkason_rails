class FavoritesController < ApplicationController

	def create
		
		favorite = Favorite.new(article_id: params[:article_id])
		favorite.save
		redirect_to articles_path
	end

	def desroy
		article = Article.find(params[:article_id])
		favorite = Favorite.find_by(article_id: params[:article_id])
		favorite.desroy
		redirect_to articles_path
	end
end
