require 'spec_helper'

describe 'ruby2fmpxml web app' do

  describe "home page" do
    let(:response) { get '/' }
    let(:home_page) { response.body }

    it "returns a page" do
      expect(response).to be_ok
    end

    it "has the right header" do
      expect(home_page).to include('Ruby to FileMaker Pro XML')
    end

    it "a form with textarea" do
      expect(home_page).to include('textarea id="my_string"')
    end
  end
end
