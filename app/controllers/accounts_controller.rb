class AccountsController < ApplicationController
  before_action :authenticate_user!

  def index
    @result = []
    @accounts = current_user.accounts
    transactions = current_user.transactions.where(status: 'Accepted') if current_user.transactions.present?
    if transactions.present?
      transactions.each do |r|
        sender_account_id = r[:sender_account_id]
        reciever_account_id = r[:reciever_account_id]
        reciever_user_id = r[:reciever_user_id]
        amount = r[:amount]
        r[:status] = ''
        r.save!
        reciever = User.find reciever_user_id
        reciever_account = reciever.accounts.where(id: reciever_account_id).first
        sender_account = current_user.accounts.where(id: sender_account_id).first
        reciever_account.balance = reciever_account.balance + amount.to_f
        sender_account.balance = sender_account.balance - amount.to_f
        sender_account.save!; reciever_account.save!
      end
    end
  end

  def new
    @account = Account.new
    @all_accounts = AccountService.new({current_user: current_user}).all_accounts
  end

  def recharge_account
    recharge_account = AccountService.new({current_user: current_user}).recharge_account(account_params)
    if recharge_account
      flash[:success] = "Account Recharged successfully."
      redirect_path = accounts_path
    else
      flash[:success] = "Amount you entered is invalid."
      redirect_path = new_account_path
    end
    redirect_to redirect_path
  end

  private
    def account_params
      params.require(:account).permit(:balance, :id)
    end
end
