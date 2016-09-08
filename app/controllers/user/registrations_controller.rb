class User::RegistrationsController < Devise::RegistrationsController

  def destroy
    super
    binding.pry
    if resource.create
      flash[:alert] = "Access Denied" and redirect_to root_path unless resource.role.admin?
    end

  end

end
