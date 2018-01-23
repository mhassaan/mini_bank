module TransactionsHelper
  def reciver_user id
    user = User.find id
    user.first_name+''+user.last_name
  end
  def reciever_account id
    account = Account.find id
    account.title
  end
end
