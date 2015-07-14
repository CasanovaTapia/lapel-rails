require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
describe "views" do
  before (:each) do
    @order = FactoryGirl.create(:order)
    @user = @order.user
    sign_in @user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, :user_id => @user.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, :user_id => @user.id, :id => @order.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, :user_id => @user.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, :user_id => @user.id, :id => @order.id
      expect(response).to have_http_status(:success)
    end
  end
end

describe "post, put, and delete" do
  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new order in the database" do
        expect{
          post :create, user_id: @user.id, order: FactoryGirl.create(:order)
        }.to change(Order, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not save the new order in the database" do
        expect{
          post :create, user_id: @user.id, order: FactoryGirl.create(:order, delivery: nil)
        }.to_not change(Contact,:count)
      end

      it "re-renders the :new template" do
        post :create, user_id: @user.id, contact: Factory.attributes_for(:order, delivery: nil)
        response.should render_template :new
      end
    end
  end

  describe "PUT #update" do
    before :each do
      @order = FactoryGirl.create(:order)
      @user = @order.user
      sign_in @user
    end

    context "valid attributes" do
      it "located the requested @order" do
        put :update, :user_id => @user.id, :id => @order.id
        assigns(:order).should eq(@order)
      end

      it "changes @order's attributes" do
        put :update, :user_id => @user.id, id: @order.id, order: @order.update_attributes(:order, status: 'completed')
        @order.reload
        @order.status.should eq("completed")
      end

      it "redirects to the updated order" do
        put :update, :user_id => @user.id, id: @order.id, order: @order.update_attributes(:order, status: 'completed')
        response.should redirect_to @order
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @order = FactoryGirl.create(:order)
    end

    it "deletes the order" do
      expect{
        delete :destroy, id: @order
      }.to change(Order,:count).by(-1)
    end

    it "redirects to orders#index" do
      delete :destroy, id: @orders
      response.should redirect_to orders_url
    end
  end
end

end
