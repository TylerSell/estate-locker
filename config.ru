require './config/environment.rb'

use Rack::MethodOverride
run ApplicationController
use FamilyMemberController
use PlanController
use UserController