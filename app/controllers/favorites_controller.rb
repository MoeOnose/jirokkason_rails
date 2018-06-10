class FavoritesController < ApplicationController
	before_action :get_cookie_to_session, :set_var

	def create
		@favorite = @article.favorites.build(session_id: session[:session_id])
		@favorite.save
	end

	def destroy
		@favorite = Favorite.find_by(article_id: @article.id)
		@favorite.destroy
	end

	private
		def set_var
			@article = Article.find(params[:article_id])
			@articles = Article.page(params[:page]).per(3).reverse_order
		end

		def get_cookie_to_session
			unless cookies[:favo_id].presence
				cookies[:favo_id] = { value: "create_favorite", domain: "http://localhost:3000/", expires: 30.days.from_now, path: url_for(only_path: true), secure: false}
				session[:session_id] = cookies[:favo_id]
			end
		end
end