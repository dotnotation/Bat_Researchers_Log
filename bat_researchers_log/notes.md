Users
    - has_many bats
    - users can create, read, update (only current_user), and delete (only current_user) bats
    - attributes:
        - username (string)
        - email (string)
        - password (string)
        - organization (string)
        - timestamps null: false

Bats
    - belongs_to users
    - attributes
        - tag/wing print number/ identification number (string) maybe slug? :identification
        - nickname? (string) maybe slug?
        - user_id
        - species (string)
        - date found (datetime)
        - timestamps null: false
        - weight (integer)
        - colony size (integer)
        - wing span (integer)
        - location found (string)
        - date last seen (datetime)
        - endangerment status (string)
        - white-nose syndrome (boolean possible radio button) 
        - notes (string, textarea)

Functions
    - create new users
    - only logged_in? users can view other users
        - if !logged_in? redirect to bat index
    - anyone can view bats
    - only the logged_in? current_user can edit their account 
    - only the logged_in? current_user can edit their own bats
    - logged_in? users can't view the signup page
    - only logged_in? users can view signout button
    - search function?
    - only the logged_in? current_user can delete their bats
    - current_user show will have slug url
    - bats index bat will list all bats
    - conditional nav bar

Pages/Routes
    - Welcome Page
        - welcome message
        - mission statement
        - get request
    - users/new (Signup)
        - signup form
        - get and post request
    - users/show (Account)
        - shows user information to logged_in? users
            - if not logged_in? redirect to login
        - if current_user edit button
        - button to all current_user bats to logged_in? users
            - if not logged_in? redirect to login
        - get and post request
    - bats/index (All Bats)
        - ordered list of all bats
        - each bat is a link
        - get request
    - bats/new
        - form to create a new bat
        - post request to /bats
    - bats/show
        - show individual bat
        - has edit button only if logged_in? current_user
    - bats/edit
        - edit individual bat if logged_in? current_user
        - patch to /bats

Nav Bar
    - if !logged_in
        - all bats
        - signup
        - home
    - if logged_in
        - all bats
        - log new bat
        - logout
        - home
        - account
        - search