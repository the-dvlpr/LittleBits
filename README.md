# App Usage

### Launch

In the console run the following commands from app directory

`rails db:create`

`rails db:migrate`

`rails db:seed`

`rails s`

##### Login

User login same as Admin login.

email: admin@example.com<br>
password: password

### Using Active Admin panel

Navigate to `/admin` to get to panel or logout to see link in header

##### Login

email: admin@example.com<br>
password: password

Click all the links in the header of dashboard (no dashboard home panel setup). Edit just about anything from Admin dash!

### Hot Reloading

Use following command to initiate hot reloading using Guard and LiveReload before spinning up rails server.

`guard -g livereload -i`

### Slim

Used for HTML templating because of readability and quick development. Uses indentation instead of open close tags.
