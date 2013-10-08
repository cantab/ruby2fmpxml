require 'spec_helper'

describe 'XML output format and grammar', type: :feature do

  before do
    visit '/'
    page.fill_in 'my_string', with: "It's a sledge"
    click_button 'Submit'
  end

  describe "XML declaration" do
    it "has an XML declaration" do
      expect(page.body).to include("<?xml")
    end

    it "has the right XML version" do
      expect(page.body).to include('version="1.0"')
    end

    it "has the right encoding" do
      expect(page.body).to include("UTF-8")
    end
  end

  describe "FMPXMLRESULT tag" do
    it "has a FMPXMLRESULT tag" do
      expect(page.body).to include("<FMPXMLRESULT")
    end

    it "has the right xmlns attribute" do
      expect(page.body).to include('xmlns="http://www.filemaker.com/fmpxmlresult')
    end

    describe "ERRORCODE tag" do
      it "has a ERRORCODE tag" do
        expect(page.body).to include("<ERRORCODE>")
      end

      it "has the right ERRORCODE attribute" do
        expect(page.body).to include("<ERRORCODE>0</ERRORCODE>")
      end
    end

    describe "PRODUCT tag" do
      it "has a PRODUCT tag" do
        expect(page.body).to include("<PRODUCT")
      end

      it "has the right BUILD attribute" do
        expect(page.body).to include('BUILD="03-21-2013"')
      end

      it "has the right NAME attribute" do
        expect(page.body).to include('NAME="FileMaker"')
      end

      it "has the right VERSION attribute" do
        expect(page.body).to include('VERSION="ProAdvanced 12.0v4"/>')
      end
    end

    describe "DATABASE tag" do
      it "has a DATABASE tag" do
        expect(page.body).to include('<DATABASE')
      end

      it "has the right DATEFORMAT attribute" do
        expect(page.body).to include('DATEFORMAT="D/m/yyyy"')
      end

      it "has the right LAYOUT attribute" do
        expect(page.body).to include('LAYOUT=""')
      end

      it "has the right NAME attribute" do
        expect(page.body).to include('NAME="Database.fmp12"')
      end

      it "has the right RECORDS attribute" do
        expect(page.body).to include('RECORDS="1"')
      end

      it "has the right TIMEFORMAT attribute" do
        expect(page.body).to include('TIMEFORMAT="h:mm:ss a"/>')
      end
    end

    describe "METADATA tag" do
      it "has a METADATA tag" do
        expect(page.body).to include('<METADATA>')
      end

      describe "FIELD tag for filing date" do
        it "has a FIELD tag for input" do
          expect(page.body).to include('<FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Input" TYPE="TEXT"/>')
        end

        it "has a FIELD tag for output" do
          expect(page.body).to include('<FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="Output" TYPE="TEXT"/>')
        end
      end
    end

    describe "RESULTSET tag" do
      it "has a RESULTSET tag" do
        expect(page.body).to include('<RESULTSET')
      end

      it "has the right FOUND attribute" do
        expect(page.body).to include('FOUND="1">')
      end

      describe "ROW tag" do
        it "has a ROW tag" do
          expect(page.body).to include('<ROW')
        end

        it "has the right MODID attribute" do
          expect(page.body).to include('MODID="0"')
        end

        it "has the right RECORDID attribute" do
          expect(page.body).to include('RECORDID="0">')
        end

        describe "COL DATA section for input" do
          it "has the right content for the COL DATA section" do
            expect(page.body).to include("<COL>\n        <DATA>It's a sledge</DATA>\n      </COL>")
          end
        end

        describe "COL DATA section for output" do
          it "has the right content for the COL DATA section" do
            expect(page.body).to include("<COL>\n        <DATA>Vg'f n fyrqtr</DATA>\n      </COL>")
          end
        end
      end
    end
  end
end
