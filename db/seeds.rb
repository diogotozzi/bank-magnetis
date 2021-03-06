# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Account.create(
  [
    {id: "1", name: "John Doe", password: "$2a$12$uA.APQ8nbDomQ6bPH.XBeuXs7GWnn/DLuBi2LBRRESHjbyJlF/eGi", token: "eyJhbGciOiJIUzI1NiJ9.IlkyNjR5anlPeG1mWWVkYksi.Tc9IQuUdQ7IaVWORuQOLIpG1emnTikIkzvDOfVnThNU"},
    {id: "2", name: "Bob Doe", password: "$2a$12$uA.APQ8nbDomQ6bPH.XBeuXs7GWnn/DLuBi2LBRRESHjbyJlF/eGi", token: "IlkyNjR5anlPeG1mWWVkYksi.eyJhbGciOiJIUzI1NiJ9.Tc9IQuUdQ7IaVWORuQOLIpG1emnTikIkzvDOfVnThNU"},
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
