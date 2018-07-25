# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
bits = ['bargraph', 'bend-sensor', 'branch', 'bright-led', 'button', 'buzzer', 'coin-battery', 'dc-motor', 'dimmer', 'doubleand', 'doubleor', 'fan', 'fork', 'inverter', 'led', 'light-sensor', 'light-trigger', 'light-wire', 'long-led', 'motion-trigger', 'power', 'pressure-sensor', 'pulse', 'rgb-led', 'roller-switch', 'servo-motor', 'slide-dimmer', 'slide-switch', 'sound-trigger', 'temperature-sensor', 'timeout', 'toggle-switch', 'usb-power', 'uv-led', 'vibration-motor', 'wire']

User.create!(name: 'Admin', email: 'admin@littlebits.com', password: 'password', password_confirmation: 'password')
AdminUser.create!(email: 'admin@littlebits.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
seph = User.create!(name: 'Seph Cordovano', email: 'j.cordovano@yahoo.com', password: 'password', password_confirmation: 'password')
nick = User.create!(name: 'Nick Olsen', email: 'nick@example.com', password: 'password', password_confirmation: 'password')

person = seph
person.inventions.create(title: 'Squishy Popcorn Dispenser', description: "This is an automatic popcorn dispenser that doesn't make popcorn, but it dispenses popcorn squishies.", user_name: person.name, user_email: person.email, image_url: 'https://images.littlebits.net/uploads/user/76639/c3028720-05b5-430f-a1ac-b12fd9596eca.png?bg=fff&fit=fill&h=500&w=650')

person = nick
person.inventions.create(title: 'El Poukavator', description: "El Poukavator is a catapult piloted by your smartphone, with the help of a simple arm movement operating a mechanism composed of a motor brain.\n\nThe catapult is also mobile. Indeed it embarks 4 drive wheels guided by 4 continuous current motors. The wheels are also guided by the bluetooth of your smartphone through an app.\n\nEl Poukavator is ideal for the \"coconut shy\".", user_name: person.name, user_email: person.email, image_url: 'https://images.littlebits.net/uploads/user/215766/82eb4c3a-4d35-4188-832d-ae5b7c30c817.jpeg?bg=fff&fit=fill&h=500&w=650')

seph.save!
nick.save!

bits.each {|name| Bit.create(name: name)} 
