class AccountController < ActionController::API
    def show
      account = Account.find(params[:id])
      transfers = Transfer.where(to_account_id: params[:id])

      sum = 0
      transfers.each do |fund|
        sum += fund.qty
      end

      render :json => {:funds => sum}, status: :ok
    end
end
