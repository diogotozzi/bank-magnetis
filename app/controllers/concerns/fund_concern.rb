module FundConcern
  def funds(account_id)
    transfers_to = Transfer.where(to_account_id: account_id)
    transfers_from = Transfer.where(from_account_id: account_id).where.not(to_account_id: account_id)

    sum = 0
    transfers_to.each do |fund|
      sum += fund.qty
    end

    transfers_from.each do |fund|
      sum -= fund.qty
    end

    return sum.to_f
  end
end
