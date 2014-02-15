class RegistrationsController < Devise::RegistrationsController

  private

    def sign_up_params
      allow = [:email, :roles, :password, :password_confirmation]
      params.require(:user).permit!
    end

end