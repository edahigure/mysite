class ArticlesController < ApplicationController

def index 
    page = params[:page] || 1  # Si no hay parámetro, usa página 1
    per_page = 4               # Artículos por página (ajústalo)
    @articles = Article.order(created_at: :desc)
    @total_pages = (@articles.count.to_f / per_page).ceil  # Calcula el total de páginas
    @articles = @articles.offset((page.to_i - 1) * per_page).limit(per_page)
end

def new
    @article = Article.new
end

def edit
    @article = Article.find(params[:id])
end

def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to @article  # or wherever you want to redirect
    else
      render 'new'
    end
end

def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
        flash[:success] = "Article was successfully updated"
        redirect_to @article
    else
        render 'edit'
    end
end

def show
    @article = Article.find(params[:id])
end

def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = "Article was successfully destroyed"
    redirect_to articles_path
end

private 
def article_params
    params.require(:article).permit(:title, :description)
end


end
