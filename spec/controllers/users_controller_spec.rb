require 'spec_helper'

describe UsersController do

  describe "GET 'books'" do
    it "should be successful" do
      get 'books'
      response.should be_success
    end
  end

  describe "GET 'lended'" do
    it "should be successful" do
      get 'lended'
      response.should be_success
    end
  end

  describe "GET 'lent'" do
    it "should be successful" do
      get 'lent'
      response.should be_success
    end
  end

end
