module SecurityConcern
  def encrypt(data)
    BCrypt::Password.create(data)
  end

  def check_password(data, password)
    BCrypt::Password.new(data) == password
  end
end
