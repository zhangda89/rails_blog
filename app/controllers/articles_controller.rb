class ArticlesController < ApplicationController
  http_basic_authenticate_with name:'dapeng', password:'dapeng', except: [:index, :show]

  def index
    @articles = Article.all
  end
 
 	def show
    @article = Article.find(params[:id])
  end
  
  def new
		@article = Article.new   
  end

  def edit
		@article = Article.find(params[:id])
  end

  def destory
		@article = Article.find(params[:id])
		@article.destory

		redirect_to articles_path
	end

  def create
    #@article = Article.new(params[:article]).permit(:title, :text)
    #@article = Article.new(params.require(:article).permit(:title, :text))
    @article = Article.new(article_params)
    if @article.save
			redirect_to @article
		else
			render 'new'
		end
    #render plain: params[:article].inspect
  end

  def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end


  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
