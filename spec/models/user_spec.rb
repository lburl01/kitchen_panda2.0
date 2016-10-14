require 'spec_helper'
require_relative '../../app/models/user'
require_relative '../../app'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

RSpec.describe User, type: :model do
  context "validations" do
    it "is invalid without a name" do
      expect(User.create(name: nil, password: "password")).to_not be_valid
    end
    it "is invalid without a password" do
      expect(User.create(name: "Miles Davis", password: nil)).to_not be_valid
    end
  end

  context "attributes" do
    let(:user) {User.create(name: "Miles Davis", password: "password")}
    it "has a name" do
      expect(user.name).to eq("Miles Davis")
    end

    it "has a password" do
      expect(user.password).to eq("password")
    end
  end
end
