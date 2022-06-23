class AccountsController < ApplicationController
  before_action :authenticate_user!
  include AccountsHelper
  def index
    @accounts = current_user.accounts
  end

  def show
  
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.user_id = current_user.id
    if @account.save
      redirect_to root_path, flash: { notice: "La cuenta ha sido creada." }
    else 
      render :new
    end
  end

  private
  def account_params
    params.require(:account).permit(:name, :handler)
  end
end
