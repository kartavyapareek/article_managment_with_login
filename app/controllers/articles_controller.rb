
class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  def index
     @articles = Article.search(params).paginate(page: params[:page], per_page: 5)
  end
 
  def show
    @article = Article.find(params[:id])
  end
 
  def new
    @article = Article.new
  end
 
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
 
  private
    def article_params
      params.require(:article).permit(:title, :text, :status, category_ids:[])
    end
end