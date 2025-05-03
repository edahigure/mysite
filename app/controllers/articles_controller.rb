class ArticlesController < ApplicationController

def index
    @articles = Article.all
end

def new
    @article = Article.new
end

def edit
    @article = Article.find(params[:id])
end

def create
    @article = Article.new(article_params)
    
    if @article.save 
        flash[:notice] ="Article was succesfully created"
        redirect_to article_path(@article)
    else
        render :new
    end
end

def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
        flash[:notice] = "Article was successfully updated"
        redirect_to article_path(@article)
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
  
    respond_to do |format|
      format.html do
        redirect_to articles_url, notice: "Artículo eliminado correctamente"
      end
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.remove("article_#{@article.id}"),
          turbo_stream.append("flash", partial: "shared/flash", locals: { notice: "Artículo eliminado" })
        ]
      end
    end
end

private 
def article_params
    params.require(:article).permit(:title, :description)
end


end
