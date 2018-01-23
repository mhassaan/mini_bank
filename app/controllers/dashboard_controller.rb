class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = TransactionService.new({current_user: current_user}).app_wide_transactions
  end

end
