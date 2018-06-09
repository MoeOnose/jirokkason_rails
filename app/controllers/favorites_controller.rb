class FavoritesController < ApplicationController
	$favo_id = nil
	def create
		unless session[:id]
			@article = Article.find(params[:article_id])
			cookies[:favo_id] = { value: "value", domain: "http://localhost:3000/", expires: 30.days.from_now, path: "/favorites", secure: false}
			session[:id] = cookies[:favo_id]
			$favo_id = cookies[:favo_id]
			@favorite = Favorite.find_by(article_id: @article.id)
			@favorite.update(count: (@favorite.count).to_i + 1)
			# @articles = Article.page(params[:page]).per(10).reverse_order
	  	end
	  		redirect_to articles_path
	end


	def destroy
		if session[:id]
			@article = Article.find(params[:article_id])
			@favorite = Favorite.find_by(article_id: @article.id)
			session[:id] = nil
			@favorite.update(count: (@favorite.count).to_i - 1)
			# @articles = Article.page(params[:page]).per(10).reverse_order
		end
			redirect_to articles_path
	end
end
