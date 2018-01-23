class BeneficiariesController < ApplicationController
  before_action :authenticate_user!

  def index
    @beneficiaries = current_user.beneficiaries
  end

  def new
    @beneficiary = BeneficiaryService.new({current_user: current_user}).create_beneficiary
  end

  def create
    beneficiary = BeneficiaryService.new({current_user: current_user}).add_beneficiary(params)
    if beneficiary
      flash[:success] = "Beneficiary addedd successfully."
      redirect_path = beneficiaries_path
    else
      flash[:error] = "User has already added this account as a beneficiary."
      redirect_path = new_beneficiary_path
    end
    redirect_to redirect_path
  end

  # For making json request
  def all_accounts
    puts params[:id]
    accounts = []
    user = User.find params[:id]
    user.accounts.each do |f|
      accounts << {id:f.id, title: f.title}
    end
    render json: accounts
  end

end
