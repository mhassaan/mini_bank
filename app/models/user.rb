class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_accounts
  has_many :accounts, through: :user_accounts
  has_many :beneficiaries
  has_many :transactions
  validates_presence_of :first_name
  validates_presence_of :last_name

# after_create :set_up_user_account

  def set_up_user_account
    account = Account.first
    user_account = UserAccount.create(user_id: self.id, account_id: account.id)
    user_account.save!
  end



end
