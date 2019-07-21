class TransferController < ActionController::API
  include FundConcern
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def create
    from_account_id = params[:from_account_id]
    to_account_id = params[:to_account_id]
    qty = params[:qty].to_f

    from_account = Account.find(from_account_id)
    to_account = Account.find(to_account_id)

    if funds(from_account_id) < qty
      render :json => {:message => "insufficient fund" }, status: :forbidden
      return
    end

    Transfer.create({from_account_id: from_account_id, to_account_id: to_account_id, qty: qty})
    render :json => {:message => "transfer successfull" }, status: :ok
  end

  def record_not_found
    render :json => {:message => "account not found"}, status: :not_found
  end
end
