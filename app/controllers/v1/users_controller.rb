module V1
  class UsersController < V1::ApplicationController
    def index
      @users = Kawsang::User.all

      render json: { users: @users }
    end
  end
end
