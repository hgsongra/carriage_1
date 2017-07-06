class Api::V1::BaseController < ActionController::API
	include Response
  include ExceptionHandler
end
