class UsersController < ApplicationController
  expose(:user)
  expose(:users) { User.all }
end
