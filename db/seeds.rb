# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Account.create(
  [
    {id: "1"},
    {id: "2"},
  ]
)

Transfer.create(
  [
    {from_account_id: "1", to_account_id: "1", qty: "10.00"},
    {from_account_id: "1", to_account_id: "1", qty: "7.20"},
    {from_account_id: "2", to_account_id: "2", qty: "5.00"},
    {from_account_id: "2", to_account_id: "2", qty: "9.00"},
    {from_account_id: "2", to_account_id: "1", qty: "3.00"},
  ]
)
