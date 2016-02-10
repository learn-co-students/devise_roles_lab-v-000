class SessionsController < ApplicationController

  def signin
    binding.pry
    session[:user_id]
  end

end