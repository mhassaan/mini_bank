class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = TransactionService.new({current_user: current_user}).all_transactions
    #@transactions = TransactionService.new({current_user: current_user}).app_wide_transactions
    @approved_transactions = TransactionService.new({current_user: current_user}).approved_transactions
  end

  def new
    @transaction = Transaction.new
    @current_user_beneficiaries = BeneficiaryService.new({current_user: current_user}).current_user_beneficiaries
    @current_user_accounts = AccountService.new({current_user: current_user}).all_accounts

  end

  def create
    transaction = TransactionService.new({current_user: current_user}).make_transaction(params)
    if transaction
      flash[:success] = "Transaction recorded successfully."
      redirect_path = transactions_path
    else
      flash[:error] = "Transaction failed. Please check your balance or enter valid amount."
      redirect_path = new_transaction_path
    end
    redirect_to redirect_path
  end

  def update_status
    transaction = Transaction.find params[:id]
    transaction.status = "Accepted"
    transaction.save!
    render json: {status: transaction.status}
  end

  def complete_transaction
    transaction = Transaction.find params[:id]
    b_account_id  = transaction.reciever_account_id
    b_user_id = transaction.reciever_user_id
    sender = transaction.user
    Account.where(id: b_account_id).first
    User.where(id: b_user_id).first
    UserAccount.where(user_id: b_user_id, account_id: b_account_id).first
    transaction.status = "Accepted"
    transaction.save!
    redirect_to accounts_path
  end

  def approve_transaction
    transaction = Transaction.find params[:id]
    b_account_id  = transaction.reciever_account_id
    b_user_id = transaction.reciever_user_id
    sender = transaction.user
    Account.where(id: b_account_id).first
    User.where(id: b_user_id).first
    UserAccount.where(user_id: b_user_id, account_id: b_account_id).first
    transaction.status = "Accepted"
    transaction.save!
    redirect_to dashboard_path
  end

end
