require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        user = User.new(email: "bob@jones.com", password: "password")
        expect(user).to be_invalid
      end

      it "is invalid without an email" do
        user = User.new(name: "bob", password: "password")
        expect(user).to be_invalid
      end

      it "is invalid without a password" do
        user = User.new(name: "bob", email: "bob@jones.com")
        expect(user).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        user = User.new(name: "bob", email: "bob@jones.com", password: "password")
        expect(user).to be_valid
      end
    end

    context "Uniqueness" do
      it { should validate_uniqueness_of(:email)}
    end
  end
end
