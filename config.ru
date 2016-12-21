require './config/environment'

use UsersController
use WishlistsController
use WishItemsController
use Rack::MethodOverride
run ApplicationController