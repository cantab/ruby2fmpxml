require 'spec_helper'

describe 'ruby2fmpxml', type: :feature do

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

    describe "form submission with POST" do
      before do
        visit '/'
        page.fill_in 'my_string', with: "It's a sledge"
        click_button 'Submit'
      end

      it "returns an XML document" do
        expect(page.body).to include("<?xml")
      end

      it "XML document is in the right grammar" do
        expect(page.body).to include('FMPXMLRESULT xmlns="http://www.filemaker.com/fmpxmlresult"')
      end

      it "has the input string" do
        expect(page.body).to include("<COL>\n        <DATA>It's a sledge</DATA>\n      </COL>")
      end

      it "has the output Rot13 result" do
        expect(page.body).to include("<COL>\n        <DATA>Vg'f n fyrqtr</DATA>\n      </COL>")
      end
    end

    describe "direct access with GET" do
      before do
        visit '/rot13/It%27s%20a%20sledge'
      end

      it "returns an XML document" do
        expect(page.body).to include("<?xml")
      end

      it "XML document is in the right grammar" do
        expect(page.body).to include('FMPXMLRESULT xmlns="http://www.filemaker.com/fmpxmlresult"')
      end

      it "has the input string" do
        expect(page.body).to include("<COL>\n        <DATA>It's a sledge</DATA>\n      </COL>")
      end

      it "has the output Rot13 result" do
        expect(page.body).to include("<COL>\n        <DATA>Vg'f n fyrqtr</DATA>\n      </COL>")
      end
    end
  end
end
