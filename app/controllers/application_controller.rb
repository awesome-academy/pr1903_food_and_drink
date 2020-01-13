class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :set_locale

  protect_from_forgery with: :exception
  helper_method :current_cart

  def current_cart
    if logged_in?
      if !session[:cart_id].nil?
        Cart.find(session[:cart_id])
      else
        Cart.new user_id: current_user.id
      end
    end
  end

  private
  def set_locale
  locale = params[:locale].to_s.strip.to_sym
  I18n.locale = I18n.available_locales.include?(locale) ?
    locale : I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
