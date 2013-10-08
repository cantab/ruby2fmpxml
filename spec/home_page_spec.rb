require 'spec_helper'

describe 'ruby2fmpxml web app', type: :feature do

  describe "home page" do
    let(:response) { get '/' }
    let(:home_page) { response.body }

    it "has the right header" do
      expect(home_page).to include('Ruby to FileMaker Pro XML')
    end

    it "has a form with textarea" do
      expect(home_page).to have_selector('textarea#my_string')
    end

    it "has a submit button" do
      expect(home_page).to have_selector('input#button_submit')
    end

    describe "form submission" do
      before do
        visit '/'
        page.fill_in 'my_string', with: "It's a sledge"
        click_button 'Submit'
      end

      it "returns the right content" do
        expect(page.body).to have_content("Vg'f n fyrqtr")
      end
    end
  end
end
