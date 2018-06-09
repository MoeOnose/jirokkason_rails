class ArticlesController < ApplicationController
  def top
  end

  def answer
		  # ここからpythonにapi通信
	@jiro_copype = `python3 ./main.py`
  	@article = Article.new
  end

  def create
  	article = Article.new(article_path)
  	article.save
	redirect_to articles_path
  end

  def index
  	@articles = Article.page(params[:page]).per(3).reverse_order
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
  		@articles = Article.page(params[:page]).per(3).reverse_order
  		render 'index'
  	end
  end

  private
	def article_path
		params.require(:article).permit(:body, :user_name, :password)
	end
end
