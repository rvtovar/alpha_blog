class ArticlesController < ApplicationController
  before_action :require_user, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated."
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted."
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :genre)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @article
    end
  end
end