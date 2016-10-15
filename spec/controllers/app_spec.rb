require 'spec_helper'
require_relative '../../app/models/user'
require_relative '../../app'

describe "App" do
  describe "homepage: GET /" do

    before(:each) do
      get '/'
    end

    it "responds with a 200 status code" do
      expect(last_response).to be_ok
    end

    it "renders the homepage view, 'index.erb'" do
      expect(last_response.body).to include("Welcome to KitchenPanda")
    end
  end

  # describe "sign-up page: GET /registrations/signup" do
  #
  #   before(:each) do
  #     get '/registrations/signup'
  #   end
  #
  #   it "responds with a 200 status code" do
  #     expect(last_response).to be_ok
  #   end
  #
  #   it "renders the sign-up template" do
  #     expect(last_response.body).to include("Sign Up")
  #   end
  # end
  #
  # describe "login page: GET /sessions/login" do
  #
  #   before(:each) do
  #     get '/sessions/login'
  #   end
  #
  #   it "responds with a 200 status code" do
  #     expect(last_response).to be_ok
  #   end
  #
  #   it "renders the sign-up template" do
  #     expect(last_response.body).to include("Log In")
  #   end
  # end
  #
  # describe "user's homepage: GET /users/home" do
  #
  #   it "responds with a 200 status code" do
  #     @user = User.create(:name => "Milo", :password => "lovesjazz")
  #     visit('sessions/login')
  #     fill_in(:name, :with => "Milo")
  #     fill_in(:password, :with => "lovesjazz")
  #     click_button("Log In")
  #     visit('/users/home')
  #     expect(page.status_code).to eq(200)
  #   end
  #
  #   it "welcomes the user" do
  #     @user = User.create(:name => "Miles", :password => "luminosity")
  #     visit('sessions/login')
  #     fill_in(:name, :with => "Miles")
  #     fill_in(:password, :with => "luminosity")
  #     click_button "Log In"
  #     visit('/users/home')
  #     expect(page.body).to include("Welcome, #{@user.name}")
  #   end
  # end

end
