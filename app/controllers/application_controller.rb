class ApplicationController < ActionController::API
  def authorize_request
    header = request.headers['token']
    account_id = params[:id] || params[:from_account_id]

    logger.debug account_id

    account = Account.where(token: header).where(id: account_id)

    if account.empty?
      render :json => {:message => "unauthorized"}, status: :unauthorized
    end
  end
end
