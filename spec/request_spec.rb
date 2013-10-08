require 'spec_helper'

describe 'requests' do

  describe "home page" do
    it "returns a page" do
      get '/'
      expect(last_response).to be_ok
    end
  end

  describe "rot13 end point" do
    context "HTTP GET" do
      it "cannot be accessed with GET" do
        get '/rot13'
        expect(last_response).to_not be_ok
      end
    end

    context "HTTP POST" do
      it "can be accessed with POST" do
        post '/rot13', my_string: "She's a man"
        expect(last_response).to be_ok
      end
    end
  end
end
