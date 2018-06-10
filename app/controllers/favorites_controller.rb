class FavoritesController < ApplicationController
	before_action :get_cookie_to_session
	def create
		@article = Article.find(params[:article_id])
		@favorite = @article.favorites.build(session_id: session[:session_id])
		@favorite.save
		@articles = Article.page(params[:page]).per(3).reverse_order
		format.html { redirect_to articles_path, notice: 'UserSkill was successfully updated.' }
        format.js
	end

	def destroy
		@article = Article.find(params[:article_id])
		@favorite = Favorite.find_by(article_id: @article.id)
		@favorite.destroy
		@articles = Article.page(params[:page]).per(3).reverse_order
		format.html { redirect_to articles_path, notice: 'UserSkill was successfully updated.' }
        format.js
	end

	private
		def get_cookie_to_session
			unless cookies[:favo_id].presence
				cookies[:favo_id] = { value: "create_favorite", domain: "http://localhost:3000/", expires: 30.days.from_now, path: url_for(only_path: true), secure: false}
				session[:session_id] = cookies[:favo_id]
			end
		end
end