require 'rails_helper'

RSpec.describe LoginController, type: :request do
  let!(:user){FactoryBot.create(:user)}

  context "When login failed" do
    context "with wrong email" do
      it "should return error message" do
        post login_index_path, params: {auth: {email: "tham@gmail.com1", password: "12345678"}}
        expect(JSON.parse(response.body)["message"]).to eq "Invalid email or password"
      end
    end

    context "with wrong password" do
      it "should return error message" do
        post login_index_path, params: {auth: {email: "tham@gmail.com", password: "112345678"}}
        expect(JSON.parse(response.body)["message"]).to eq "Invalid email or password"
      end
    end
  end

  context "When login success" do
    context "valid email and password" do
      it "should return correct user email" do
        post login_index_path, params: {auth: {email: "tham@gmail.com", password: "12345678"}}
        expect(JSON.parse(response.body)["data"]).to eq user.email
      end
    end
  end
end
