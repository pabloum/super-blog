class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    # add custom create logic here
    @user = User.create(registration_params)
    if @user.save
      sign_in(@user)
      redirect_to posts_path, notice: "The post was succesfully saved"
    else
      # redirect_to new_user_registration_path
      render :new
    end
  end

  def update
    super
  end

  private
    def registration_params
      params.require(:user).permit(:name, :email, :password)
    end
end
