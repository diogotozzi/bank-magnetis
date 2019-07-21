class AccountController < ActionController::API
  include FundConcern
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def show
    account = Account.find(params[:id])
    render :json => {:funds => funds(params[:id])}, status: :ok
  end

  def record_not_found
    render :json => {:message => "account not found"}, status: :not_found
  end
end
