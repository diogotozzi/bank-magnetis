module JsonWebTokenConcern
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  def encode(data)
    JWT.encode(data, SECRET_KEY)
  end

  def decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end
