class Admin::AdminsController < AdminController
  inherit_resources
  defaults :route_prefix => 'admin'
end
