class ArticlesController < ApplicationController
  def top
  end

  def answer
  	if params[:send_action]
  		# ここからpythonにapi通信
 	end
  	@article = Article.new
  end

  def create
  	article = Article.new(article_path)
  	article.save
  	redirect_to articles_path

  end

  def index
  	@articles = Article.page(params[:page]).per(10).reverse_order
  end

  def show
  	@article = Article.find(params[:id])
  end

  def destroy
  	article = Article.find(params[:id])
  	if article.password == params[:password]
  		article.delete
  		redirect_to root_path
  	else
  		@articles = Article.page(params[:page]).per(10).reverse_order
  		render 'index'
  	end

  end

  private
  def article_path
  	params.require(:article).permit(:title, :body, :user_name, :password)
  end
end
