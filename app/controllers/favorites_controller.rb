class FavoritesController < ApplicationController
	before_action :get_cookie_to_session
	def create
		@article = Article.find(params[:article_id])
		@favorite = @article.favorites.build(session_id: session[:id])
		if @favorite.save
			redirect_to articles_path
		else
			@articles = Article.page(params[:page]).per(3).reverse_order
			render controller: "articles", action: "index"
		end
	end

	def destroy
		@article = Article.find(params[:article_id])
		@favorite = Favorite.find_by(article_id: @article.id)
		@favorite.destroy
		redirect_to articles_path
	end

	private
		def get_cookie_to_session
			cookies[:favo_id] = { value: "create_favorite", domain: "http://localhost:3000/", expires: 30.days.from_now, path: "/favorites", secure: false}
			session[:id] = cookies[:favo_id]
		end
end