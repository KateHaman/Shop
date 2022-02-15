class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :current_order

  def current_order
    Order.draft.find_or_create_by(user: current_user)
  end
end
