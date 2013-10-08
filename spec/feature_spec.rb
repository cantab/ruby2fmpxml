require 'spec_helper'

describe 'ruby2fmpxml web app' do

  it "has a home page" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('Ruby to FileMaker Pro XML')
  end
end
