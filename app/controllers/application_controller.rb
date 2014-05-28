class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :employee_not_authorized

  before_filter :authenticate_employee!

  def user_for_paper_trail
    request.env["PATH_INFO"] =~ /(meta)/ ? current_superuser : current_employee
  end

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

    def pundit_user
      current_employee
    end

  private

    def employee_not_authorized
      @error_message = 'You are not authorized to perform this action'

      respond_to do |format|
        format.js
      end
    end
end
