class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  allow_browser versions: :modern

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name])
  end

  def current_cart
    if user_signed_in?
      find_or_create_user_cart
    else
      find_or_create_guest_cart
    end
  end

  def find_or_create_user_cart
    cart = current_user.cart || current_user.create_cart!
    cart.merge_guest_cart(session.delete(:cart_id))
    cart
  end

  def find_or_create_guest_cart
    if session[:cart_id]
      Cart.find(session[:cart_id])
    else
      cart = Cart.create!
      session[:cart_id] = cart.id
      cart
    end
  end
end
