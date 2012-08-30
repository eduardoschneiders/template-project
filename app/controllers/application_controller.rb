class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  protected
  def render_404
    raise ActionController::RoutingError.new('Not Found')
  end

  def set_locale
    if user_signed_in?
      I18n.locale = current_user.locale
    else
      I18n.locale = session[:locale] || I18n.default_locale
    end
  end
end