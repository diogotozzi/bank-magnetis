class CreateFundIdSequence < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE SEQUENCE fund_id_seq;
    SQL
  end

  def down
    execute <<-SQL
      DROP SEQUENCE fund_id_seq;
    SQL
  end
end
