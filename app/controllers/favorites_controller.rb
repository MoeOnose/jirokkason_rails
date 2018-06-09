class FavoritesController < ApplicationController

	def create
		
		@favorite = Favorite.new(article_id: params[:article_id])
		@articles = Article.page(params[:page]).per(10).reverse_order
		redirect_to articles_path
	end

	def desroy
		favorite = Favorite.find_by(article_id: params[:article_id])
		favorite.desroy
		@articles = Article.page(params[:page]).per(10).reverse_order
		redirect_to articles_path
	end
end
