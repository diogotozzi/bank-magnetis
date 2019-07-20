class AccountController < ActionController::API
    def show
      account = Account.find(params[:id])
      transfers_to = Transfer.where(to_account_id: params[:id])
      transfers_from = Transfer.where(from_account_id: params[:id]).where.not(to_account_id: params[:id])

      sum = 0
      transfers_to.each do |fund|
        sum += fund.qty
      end

      transfers_from.each do |fund|
        sum -= fund.qty
      end

      render :json => {:funds => sum}, status: :ok
    end
end
