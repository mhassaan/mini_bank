class BeneficiaryService
  def initialize args={}
    @current_user = args[:current_user]
  end

  def create_beneficiary
    Beneficiary.new
  end

  def add_beneficiary(args ={})
    # Requires helper_user_id, beneficiary_user_id & beneficiary_account_id .

    beneficiary = @current_user.beneficiaries.where(benefactor_id: args[:beneficiary][:benefactor_id], account_id: args[:beneficiary][:account_id]).first
    if beneficiary.present?
      result = "User has already added this account as a beneficiary."
      false
    else
      unless args[:beneficiary][:account_id] == "Please select account"
        user_beneficiary = @current_user.beneficiaries.new(benefactor_id: args[:beneficiary][:benefactor_id], account_id: args[:beneficiary][:account_id])
        user_beneficiary.save!
      end
    end
  end


  def all_beneficiaries
    users = {}
    User.all.each do |user|
      if user != @current_user
        name = user.first_name+' '+user.last_name
        users[name] = user.id
      end
    end
    users
  end


  def current_user_beneficiaries
    users = {}
    @current_user.beneficiaries.all.each do |b|
      user = User.find(b[:benefactor_id])
      name = user.first_name+' '+user.last_name
      users[name] = user.id
    end
    users

  end

end
