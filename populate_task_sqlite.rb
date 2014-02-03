# namespace :db do
   # HMSET key field value [field value ...] 
  # desc "Fill database with sample data"
  require 'faker'
  require 'sqlite3'
  require './config'
  require 'benchmark'
  require 'activerecord'
  
  include Benchmark  
  # task populate: :environment do

    # Rake::Task['db:reset'].invoke
    class User < ActiveRecord::Base
    end
  
    1000.times do |n|
      password = Faker::Lorem.sentences(1).first
      prenom = Faker::Lorem.sentences(1).first[0...20]
      email = Faker::Lorem.sentences(1).first[0...20]
      bio = Faker::Lorem.sentences(1000).join('zombo')
      nom = Faker::Lorem.sentences(1).first[0..10]
      username = "user" + n.to_s
      User.create(prenom: prenom,
                 nom: nom,
                 email: email,
                 bio: bio,
                 password: password
               )
      # $r.HMSET('users', username, h)
    end
  # end

  # desc "Test retrieve info user"
  # end
# end

# key = {
#   field: { field: value}
# }


