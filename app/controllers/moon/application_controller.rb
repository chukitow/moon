module Moon
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_order

    def current_order
      session[:moon_order_id].nil? ? Moon::Order.new : Moon::Order.includes(:line_items).find(session[:moon_order_id])
    end
  end
end
