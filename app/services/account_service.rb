class AccountService

  def initialize args={}
    @current_user = args[:current_user]
  end

  def self.set_up_account(args={})
    # Requires user_id & account_id to set up user's account.
    user = User.find args[:user_id]
    user_account = user.accounts.where(id: args[:account_id]).first
    if user_account.present?
      error = "An account of this type already exists for this user."
    else
      user_account = UserAccount.create(user_id: args[:user_id], account_id: args[:account_id])
      user_account.save!
    end
  end

  def recharge_account(args={})
    # Requires user_id, amount & ID of an account that needs to be recharged
    unless args[:balance].to_f.negative?
      user_account = @current_user.accounts.where(id: args[:id]).first
      user_account.balance = (user_account.balance.present?)? user_account.balance : 0.0
      user_account.balance += args[:balance].to_f
      user_account.save!
    else
      false
    end
  end

  def all_accounts
    accounts = {}
    @current_user.accounts.each do |f|
      accounts[f.title] = f.id
    end
    accounts
  end

  # def current_user_accounts
  #   accounts = {}
  #   @current_user.accounts.each do |f|
  #     accounts[f.title] = f.id
  #   end
  #   accounts
  # end


end
