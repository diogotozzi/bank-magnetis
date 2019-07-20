class TransferController < ActionController::API
    def create
      @account = Account.create(id: "1")
    end
end
