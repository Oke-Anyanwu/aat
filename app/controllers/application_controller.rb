class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

    def after_sign_in_path_for(resource)
      return employees_path if resource.instance_of?(Employee)
      return "/meta" if resource.instance_of?(Superuser)
    end

    def after_sign_out_path_for(resource)
      case resource
      when :superuser then new_superuser_session_path
      when :employee then new_employee_session_path
      end
    end
end
