require './config/environment'

use Rack::MethodOverride
run ApplicationController
use FamilyMemberController
use PlanController
use UserController