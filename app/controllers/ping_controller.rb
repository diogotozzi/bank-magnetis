class PingController < ApplicationController
  def index
    render :json => {:ping => "pong"}, status: :ok
  end
end
