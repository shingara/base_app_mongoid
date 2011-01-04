class UsersController < InheritedResources::Base
  actions :all, :except => [:new]
end
