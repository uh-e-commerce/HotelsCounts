class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def add_column(sheet, from, to, from_doc)
    from_doc.column(from).each_with_index do |member, index|
      sheet[index,to-1] = member
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
