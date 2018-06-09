class FavoritesController < ApplicationController
	$favo_id = nil
	def create
		if $favo_id == nil
			@article = Article.find(params[:article_id])
			cookies[:favo_id] = { value: "value", domain: "http://localhost:3000/", expires: 30.days.from_now, path: "/favorites", secure: false}
			$favo_id = cookies[:favo_id]
			@favorite = Favorite.find_by(article_id: @article.id)
			@favorite.update(count: (@favorite.count).to_i + 1)
			# @articles = Article.page(params[:page]).per(10).reverse_order
	  	end
	  		redirect_to articles_path
	end


	def destroy
		unless $favo_id == nil
			@article = Article.find(params[:article_id])
			@favorite = Favorite.find_by(article_id: @article.id)
			$favo_id = nil
			@favorite.update(count: (@favorite.count).to_i - 1)
			# @articles = Article.page(params[:page]).per(10).reverse_order
		end
			redirect_to articles_path
	end
end
