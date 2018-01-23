module BeneficiariesHelper
  def benefactor_name id
    user = User.find id
    user.first_name+''+user.last_name
  end

  def benefactor_account id
    account = Account.find id
    account.title
  end
end
