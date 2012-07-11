require_relative '../../test_helper'
 
describe Talonario do
 
  it "version must be defined" do
    Talonario::VERSION.wont_be_nil
  end
 
end