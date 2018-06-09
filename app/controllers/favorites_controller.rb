class FavoritesController < ApplicationController
	before_action :get_cookie_to_session
	def create
		@article = Article.find(params[:article_id])
		@favorite = @article.favorites.build(session_id: session[:id])
		@favorite.save
		@articles = Article.page(params[:page]).per(3).reverse_order
	end

	def destroy
		@article = Article.find(params[:article_id])
		@favorite = Favorite.find_by(article_id: @article.id)
		@favorite.destroy
		@articles = Article.page(params[:page]).per(3).reverse_order
	end

	private
		def get_cookie_to_session
			unless cookies[:favo_id].presence
				cookies[:favo_id] = { value: "create_favorite", domain: "http://localhost:3000/", expires: 30.days.from_now, path: "/favorites", secure: false}
				session[:id] = cookies[:favo_id]
			end
		end
end