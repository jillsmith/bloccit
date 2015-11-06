require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do
  #let(:topic) { Topic.create!(name: "My awesome topic", description: "Has a long enough body to meet validation") }
  describe "GET #show" do
    it "returns http success" do
      get :show, topic_id: topic.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, topic_id: topic.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, topic_id: topic.id
      expect(response).to have_http_status(:success)
    end
  end

end
