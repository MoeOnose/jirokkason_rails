class ArticlesController < ApplicationController
  def top

  end

  def create
  	if params[:send_action]
  		# ここからpythonにapi通信

  		redirect_to :action => 'answer'
 	end
  end

  def show
  end

  def answer
  end

  def index
  end
end
