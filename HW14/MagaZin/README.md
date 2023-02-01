Hello. My simple project (online store). 
Item selected from my favorite game World of Warcraft.

Start to work!

git clone https://github.com/fillson22/RubyHW.git
cd RubyHW/HW14

Change config/database_copy.yml on config/database.yml with your params(username and password)

Type in console:

!!! brew install vips

!!! sudo apt-get install -y libvips

bundle install
rails db:create
rails db:migrate
rails db:seed
rails s

On browser:

All images in folder /assets

User mode:

http://127.0.0.1:3000/
Login: fillson@example.com
password: 11111111 

or SignUp new user

Admin mode:

http://127.0.0.1:3000/admin
Login: admin@example.com
password: password
