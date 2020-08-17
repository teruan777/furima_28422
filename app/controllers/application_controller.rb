class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_peritted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
   
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end

    def configure_peritted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :familyname_kanji, :firstname_kanji, :familyname_katakana, :firstname_katakana, :birthday])
    end
  end
end

