class TransferController < ApplicationController
  include FundConcern
  include SecurityConcern

  before_action :authorize_request
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def create
    from_account_id = params[:from_account_id]
    to_account_id = params[:to_account_id]
    qty = params[:qty].to_f
    password = params[:password]

    from_account = Account.find(from_account_id)
    to_account = Account.find(to_account_id)

    unless check_password(from_account.password, password)
      render :json => {:message => "wrong credentials"}, status: :forbidden
      return
    end

    if funds(from_account_id) < qty
      render :json => {:message => "insufficient fund"}, status: :forbidden
      return
    end

    Transfer.create({from_account_id: from_account_id, to_account_id: to_account_id, qty: qty})
    render :json => {:message => "transfer successfull"}, status: :ok
  end

  def record_not_found
    render :json => {:message => "account not found"}, status: :not_found
  end
end
