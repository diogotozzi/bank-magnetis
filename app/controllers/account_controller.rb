class AccountController < ApplicationController
  include FundConcern
  include JsonWebTokenConcern
  include SecurityConcern

  before_action :authorize_request, except: :create
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def show
    account = Account.find(params[:id])
    render :json => {:funds => funds(params[:id])}, status: :ok
  end

  def create
    account_id = params[:account_id]
    name = params[:name]
    password = params[:password]
    token = encode(SecureRandom.alphanumeric)

    Account.create({id: account_id, name: name, password: encrypt(password), token: token })

    render :json => {:token => token}, status: :created
  end

  def record_not_found
    render :json => {:message => "account not found"}, status: :not_found
  end
end
