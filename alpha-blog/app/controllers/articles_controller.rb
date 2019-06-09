class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_param)
    # @article.save
    # redirect_to articles_show(@article)
    if @article.save
      flash[:notice] = "article was created"
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_param)
      flash[:notice] = "article update"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private
    def article_param
      params.require(:article).permit(:title, :description)
    end

end
