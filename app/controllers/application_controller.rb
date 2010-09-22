class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper :products
  
end
