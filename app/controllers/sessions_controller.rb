class SessionsController < ApplicationController

    def new 

    end

    def create
        # Asegúrate de recibir los parámetros en el nivel raíz
        email = params[:email]
        password = params[:password]
      
        # Validación básica
        if email.blank? || password.blank?
          flash.now[:danger] = "Email and password are required"
          return render 'new'
        end
      
        user = User.find_by(email: email.downcase.strip)
        
        if user&.authenticate(password)
          session[:user_id] = user.id
          flash[:success] = "Logged in successfully"
          redirect_to user_path(user)
        else
          flash.now[:danger] = "Invalid credentials"
          render 'new'
        end
      end

    def destroy
        session[:user_id] = nil
        flash[:success] = "You have logged out"
        redirect_to root_path
    end

end
