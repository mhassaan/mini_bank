class TransactionService

  def initialize args={}
    @current_user = args[:current_user]
  end

  def make_transaction(args={})
    reciever_user_id = args[:reciever_user_id]
    reiever_account_id = args[:reciever_account_id]
    sender_account_id = args[:sender_account_id]
    amount = args[:amount]
    if amount.to_f.negative?
      false
    else
      account = @current_user.accounts.where(id: sender_account_id).first
      if account.balance.to_f > amount.to_f
        transaction = @current_user.transactions.new(sender_account_id:sender_account_id, reciever_user_id: reciever_user_id, reciever_account_id: reiever_account_id, amount: amount, status: 'pending')
        transaction.save!
      else
        false
      end
    end

  end

  def all_transactions
    transactions = @current_user.transactions.where(status: 'pending')
  end

  def app_wide_transactions
    transactions = Transaction.where(status: 'pending')
  end

  def approved_transactions
    transactions= @current_user.transactions.where(status: 'Accepted')
  end
end
