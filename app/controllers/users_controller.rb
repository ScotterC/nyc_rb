class UsersController < ApplicationController

  def me
    if current_user
      @me_user_id = current_user.id
      @me_current_user = true
    else
      @me_user_id = nil
      @me_current_user = false
    end

    respond_to do |format|
      format.json
    end
  end
end
