# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

STATES.each do |st|
  State.create(
    name: st[0],
    abbreviation: st[1],
    service_offered: st[2],
    minimum_age: st[3]
  )
end

CATEGORIES.each do |cat|
  Category.create(name: cat)
end

PRODUCTS.each do |prod|
  Product.create(
    name: prod[:name],
    category: Category.find_by(name: prod[:category]),
    identifier: prod[:ndc],
    quantity: prod[:qty],
    price: prod[:price],
    instructions: prod[:instructions]
  )
end

Patient.create(
  name: 'Test Patient',
  email: 'test@gmail.com',
  birthdate: '1984-01-01',
  state: State.find_by(abbreviation: 'NY')
)

Prescription.create(
  product: Product.first,
  patient: Patient.first
)