require 'rails_helper'

RSpec.describe 'User profile updates', type: :request do
  let(:user) { User.create!(email: "user@example.com", password: "password", name: "Old Name", bio: "Old Bio") }

  before do
    sign_in user
  end

  describe "PATCH /users" do
    it "updates name and bio with valid current password" do
      patch user_registration_path, params: {
        user: {
          name: "New Name",
          bio: "New Bio",
          current_password: "password"
        }
      }

      user.reload
      expect(user.name).to eq("New Name")
      expect(user.bio).to eq("New Bio")
    end

    it "does not update if current password is wrong" do
      patch user_registration_path, params: {
        user: {
          name: "Hacker Name",
          current_password: "wrongpassword"
        }
      }

      user.reload
      expect(user.name).not_to eq("Hacker Name")
    end

    it "does not allow updating protected attributes" do
      patch user_registration_path, params: {
        user: {
          admin: true, # Assuming you have an admin flag or similar
          current_password: "password"
        }
      }

      user.reload
      expect(user.respond_to?(:admin) ? user.admin : false).to be_falsey
    end
  end
end