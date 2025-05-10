class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show]
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:succes] = "Welcome to the alpha blog #{@user.username}"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def edit
        
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = "Your account was updated successfully"
            redirect_to articles_path
        else
            render 'edit'
        end
    end

    def show 
        
    end

    def index
        page = params[:page] || 1  # Si no hay parámetro, usa página 1
        per_page = 2               # Artículos por página (ajústalo)
        @users = User.order(created_at: :desc)
        @total_pages = (@users.count.to_f / per_page).ceil  # Calcula el total de páginas
        @users = @users.offset((page.to_i - 1) * per_page).limit(per_page)
    end

    private
    def user_params 
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

end



 