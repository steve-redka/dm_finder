class UsersController < Devise::RegistrationsController
    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end
    def update
        @user = User.find(params[:id])
        p user_params
        if @user.update(user_params)
            redirect_to @user, notice: 'User was successfully updated.'
        else
            flash.now[:danger] = "Error updating user: #{@user.errors.full_messages.join(", ")}"
            render :edit
        end
    end
end