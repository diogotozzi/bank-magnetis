class TransferController < ActionController::API
    def index
      render :json => {:name => "hello"}, status: :ok
    end

    def create
      @account = Account.create(id: "1")
    end
end
