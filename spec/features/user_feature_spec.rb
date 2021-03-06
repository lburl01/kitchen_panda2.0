require 'spec_helper'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])


RSpec.feature "User sign up, log in, sign out", :type => :feature do

  let!(:valid_user) {User.create(name: "Milo", password: "likesjazz")}

  describe "user sign up", :type => :feature do

    before(:each) do
      visit '/'
      click_link 'Sign Up'
    end

    it 'successfully signs up with a name and password' do
      expect(current_path).to eq('/registrations/signup')
      fill_in("name", :with => valid_user.name)
      fill_in("password", :with => valid_user.password)
      click_button('Sign Up')
      expect(current_path).to eq('/users/home')
      expect(page).to have_content("Welcome, #{valid_user.name}!")
    end

  end

  describe "user login", :type => :feature do
    before(:each) do
      visit '/'
      click_link 'Log In'
    end

    it 'successfully logs in with a name and password' do
      expect(current_path).to eq('/sessions/login')
      fill_in("name", :with => valid_user.name)
      fill_in("password", :with => valid_user.password)
      click_button('Log In')
      expect(current_path).to eq('/users/home')
      expect(page).to have_content("Welcome, #{valid_user.name}!")
    end

    it 'fails to log in with an incorrect password' do
      expect(current_path).to eq('/sessions/login')
      fill_in("name", :with => valid_user.name)
      fill_in("password", :with => "wrong")
      click_button('Log In')
      expect(current_path).to eq('/sessions')
      expect(page).to have_content("undefined method `id' for nil:NilClass")
    end
  end

  describe "user log out", :type => :feature do
    it 'successfully logs out and redirects to the homepage' do
      visit '/'
      click_link 'Log In'
      fill_in("name", :with => valid_user.name)
      fill_in("password", :with => valid_user.password)
      click_button('Log In')
      click_link('Log Out')
      expect(current_path).to eq('/')
      expect(page).to have_content('Log In')
    end
  end
end
