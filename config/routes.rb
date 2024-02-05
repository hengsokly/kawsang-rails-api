Rails.application.routes.draw do
  # ------**Login**--------
  # POST http://localhost:3000/oauth/token?grant_type=password&email=USER_EMAIL&password=USER_PASSWORD&client_id=CLIENT_ID&client_secret=CLIENT_SECRET
  # Replace USER_EMAIL, USER_PASSWORD, CLIENT_ID, CLIENT_SECRET
  # Note: CLIENT_ID, CLIENT_SECRET are from your doorkeeper application
  # Response:
  #   {
  #     "access_token": "n5GeVhicBSxIg1tJ8AEfqJ4I3lpS8H8NGtg6bnCvjUU",
  #     "token_type": "Bearer",
  #     "expires_in": 7200,
  #     "refresh_token": "9DYVS0sOeec5ihhGeDRhgTBlhBDrbKHBCFURamqiaTM",
  #     "created_at": 1707100357
  #   }
  # Readmore: https://rubyyagi.com/rails-api-authentication-devise-doorkeeper/

  # Logout: To log out a user, we can revoke the access token, and to revoke an access token, we need to send a HTTP POST request to /oauth/revoke, with token, client_id and client_secret attributes.
  #   POST http://localhost:3000/oauth/revoke?token=n5GeVhicBSxIg1tJ8AEfqJ4I3lpS8H8NGtg6bnCvjUU&client_id=VvWJc2jderqHLqX9dFVWJtkU6jjKUvs3shB4hut33Gc&client_secret=LmO8FDNh8NTMI-iMR39b2ub88a2u7k3HIM6YShsRXYc

  # Refresh token: To retrieve a new access token when the current access token is (almost) expired, we can send a HTTP POST to /oauth/token
  #   POST http://localhost:3000/oauth/token?grant_type=refresh_token&refresh_token=AKZ_uZV6MzgZ2GVGxzBnXVewl-o0IpCBFggqox7i2FM&client_id=VvWJc2jderqHLqX9dFVWJtkU6jjKUvs3shB4hut33Gc&client_secret=LmO8FDNh8NTMI-iMR39b2ub88a2u7k3HIM6YShsRXYc
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  # ------****--------

  # Get resource
  #   GET http://localhost:3000/v1/users
  #   Header: Authorization: Bearer ACCESS_TOKEN
  #   Replace ACCESS_TOKEN with the token you get from above
  namespace :v1 do
    resources :users, only: %i[index]
  end
end
