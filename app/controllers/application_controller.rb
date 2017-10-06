class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  before_action :set_locale

  class << self
    def default_url_options
      {locale: I18n.locale}
    end
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def not_found
    flash[:danger] = t "controller.application.not_found"
    redirect_to root_path
  end
end
