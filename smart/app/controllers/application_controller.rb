class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource

  private
    # set for devise login redirector
    def after_sign_in_path_for(resource)
      case resource
      when User
        # put here for User first page direct path after signed in
        root_path
      when Staff
        # your_staff_home_path
        super # 現在は暫定的に上位継承しています
      else
        super
      end
    end

    def after_sign_out_path_for(resource)
      case resource
      when User, :user, :users
        new_user_session_path
        # put here for User default page direct path after signed out
      when Staff, :staff, :staffs
        new_staff_session_path
        # put here for Staff default page direct path after signed out
      else
        super
      end
    end

  # Layout per resource_name
  def layout_by_resource
    if devise_controller? && resource_name == :staff
      "staffs"
    else
      "application"
    end
  end
end
