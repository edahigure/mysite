class CategoriesController < ApplicationController
    def index
        page = params[:page] || 1  # Si no hay parámetro, usa página 1
        per_page = 4               # Artículos por página (ajústalo)
        @categories = Category.order(created_at: :desc)
        @total_pages = (@categories.count.to_f / per_page).ceil  # Calcula el total de páginas
        @categories = @categories.offset((page.to_i - 1) * per_page).limit(per_page)
 
    end
    def new
        @category = Category.new
    end
    def show 
    end
    def create 
        @category = Category.new(category_params)
        if @category.save
            flash[:success] = "Category was created successfully"
            redirect_to categories_path
        else
            render :new, status: :unprocessable_entity 
        end
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end

end
