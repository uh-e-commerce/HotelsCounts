# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Carga Inicial de Paises y Agencias...

# cuba = Country.create(name: "Cuba")
# brazil = Country.create(name: "Brazil")
# canada = Country.create(name: "Canada")
# china = Country.create(name: "China")

# cubanacan = Agency.create(name: "Cubanacan", country_id: cuba.id)
# brazilacan = Agency.create(name: "Brazilacan", country_id: brazil.id)
# candanacan = Agency.create(name: "Canadanacan", country_id: canada.id)
# chinanacan = Agency.create(name: "Chinanacan", country_id: china.id)

cubanaCan = HotelChain.create(name: "CubanaCan")
cubanaCan.hotels.create(name: "Melia Coiba")