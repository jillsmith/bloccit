require 'rails_helper'
include RandomData

RSpec.describe AdvertisementsController, type: :controller do
  
  let (:my_ad) do
    Advertisement.create(
      id: 1,
      title: RandomData.random_sentence,
      copy: RandomData.random_paragraph,
      price: 99
      )
    end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
      
      it "assigns [my_add} to @advertisements" do
        get :index
        expect(assigns(:advertisements)).to eq([my_ad])
      end
    end
    
    describe "PUT update" do
      it "updates post with expected attributes" do
        new_title = RandomData.random_sentence
        new_body = RandomData.random_paragraph
        put :update, id: my_post.id, post: {title: new_title, body: new_body}
        updated_post = assigns(:post)
        expect(updated_post.id).to eq my_post.id
        expect(updated_post.title).to eq new_title
        expect(updated_post.body).to eq new_body
      end
      
     it "redirects to the updated post" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
     end
   end

end
