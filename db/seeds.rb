# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = Category.create([{name:'Politica', description:'todo lo relacionado a politica'},
                            {name:'Sociedad', description:'contextos que hacen referencia a la vida en sociedad'},
                            {name:'Economía', description:'aspectos económicos'},
                            {name:'Tecnología', description:'referente a tecnologías'},
                            {name:'Cultural', description:'referente a la cultura'}])

user1 = User.create(email: 'usuario1@correo.com', password: '123456')
user2 = User.create(email: 'usuario2@correo.com', password: '123456')


  5.times do |i|
    user1.contexts.create(title: "Contextos ##{i}", description: "Contexto", category_id:categories.sample.id)
    user2.contexts.create(title: "Contextos ##{i}", description: "Contexto", category_id:categories.sample.id)
  end

  user1.contexts.each_with_index do |contexto, i|
    contexto.information_posts.create(title: "Informacion ##{i}", summary:"Resumen de la informacion ##{i}", url:"Link de la informacion ##{i}")
  end

  user2.contexts.each_with_index do |contexto, i|
    contexto.information_posts.create(title: "Informacion ##{i}", summary:"Resumen de la informacion ##{i}", url:"Link de la informacion ##{i}")
  end
