# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

Post.create([
  { title: 'TIL Ruby on Rails', contents: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' },
  { title: 'Here is a cool link', contents: 'https://cuchi.me' },
])
