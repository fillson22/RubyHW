Start to work!

git clone https://github.com/fillson22/RubyHW.git
cd RubyHW/HW11
gem install bundler
bundle install
Change config/database_copy.yml on config/database.yml with your username and password

Type in console:

rails db:create
rails db:migrate
rails db:seed
rails s

On browser:

http://127.0.0.1:3000/
Login with fillson@example.com, password: 11111111 or SignUp new user

If admin mode:

http://127.0.0.1:3000/admin
Login with admin@example.com, password: password
