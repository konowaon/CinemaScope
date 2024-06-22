# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Genre.create(name: 'Action')
Genre.create(name: 'Drama')
Genre.create(name: 'Comedy')

User.create(email: 'user@example.com', password: 'password')
Movie.create(title: 'Inception', description: 'A mind-bending thriller', rating: 9.0, genre_id: 1)
Movie.create(title: 'The Dark Knight', description: 'A superhero film', rating: 8.5, genre_id: 1)
# Review.create(content: 'Amazing movie!', user_id: 1, movie_id: 1)
# Review.create(content: 'A masterpiece!', user_id: 1, movie_id: 2)
Movie.create(title: 'Inception', description: 'A mind-bending thriller', rating: 9.0, genre_id: 1, poster_url: 'URL_TO_POSTER')
Admin.create!(
  email: 'admin@example.com', # 特定の管理者のメールアドレス
  password: 'password',       # 特定の管理者のパスワード
  password_confirmation: 'password'
)