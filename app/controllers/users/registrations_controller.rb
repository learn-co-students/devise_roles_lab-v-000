class Users::RegistrationsController < Devise::RegistrationsController

  def destroy
    super
    binding.pry
    if resource.destroy
      flash[:alert] = "Access Denied" and redirect_to root_path unless resource.role.admin?
    end

  end

end
