require 'rails_helper'
include RandomData

RSpec.describe AdvertisementsController, type: :controller do
  
  let (:my_ad) do
    Advertisement.create(
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
      
      it "assigns [my_ad} to @advertisements" do
        get :index
        expect(assigns(:advertisements)).to eq([my_ad])
      end
    end
    
    describe "PUT update" do
      it "updates advertisement with expected attributes" do
        new_title = RandomData.random_sentence
        new_copy = RandomData.random_paragraph
        new_price = RandomData.random_number
        put :update, advertisement: {title: new_title, copy: new_copy, price: new_price}
        updated_advertisement = assigns(:advertisement)
        
        expect(updated_advertisement.title).to eq new_title
        expect(updated_advertisement.copy).to eq new_copy
        expect(updated_advertisement.price).to eq new_price
      end
      
     it "redirects to the updated advertisement" do
       new_title = RandomData.random_sentence
       new_copy = RandomData.random_paragraph
       new_price = RandomData.random_number
     end
   end

end
