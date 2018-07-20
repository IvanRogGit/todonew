class ApplicationController < ActionController::Base

	http_basic_authenticate_with name: "lincoln" , password: "1809"
end
