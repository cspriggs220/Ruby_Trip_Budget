require_relative 'bootstrap_ar'
connect_to 'development'

Category.create( name: 'Food' )
Category.create( name: 'Entertainment' )
Category.create( name: 'Lodging' )
Category.create( name: 'Airfare' )
Category.create( name: 'Fuel' )
Category.create( name: 'Shopping' )
Category.create( name: 'Other' )

