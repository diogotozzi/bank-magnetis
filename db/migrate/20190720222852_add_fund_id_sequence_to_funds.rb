class AddFundIdSequenceToFunds < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER SEQUENCE fund_id_seq OWNED BY funds.id;
      ALTER TABLE funds ALTER COLUMN id SET DEFAULT nextval('fund_id_seq');
    SQL
  end

  def down
    execute <<-SQL
      ALTER SEQUENCE fund_id_seq OWNED BY NONE;
      ALTER TABLE funds ALTER COLUMN id SET NOT NULL;
    SQL
  end
end
