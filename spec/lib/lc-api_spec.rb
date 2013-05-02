require 'spec_helper'

describe LcApi do
  
  it "returns the default base uri when no base path is configured" do
    LcApi.base_uri.should eq("http://0.0.0.0:3000/v1/")
  end
  
  it "returns a default value if the api key is not set by the user, but is accessed" do
    LcApi.key = "Key Not Set"
    LcApi.key.should eq("Key Not Set")
  end
  
  it "returns the user-assigned base uri when a base uri property is set" do
    LcApi.base_uri = "http://lifechurch.tv/api/v1/"
    LcApi.base_uri.should eq("http://lifechurch.tv/api/v1/")
  end
  
  it "returns the user-assigned key when a key property is set" do
    LcApi.key = "6bf76818d8ccdc3c8cbd1b17c614c43f"
    LcApi.key.should eq("6bf76818d8ccdc3c8cbd1b17c614c43f")
  end
  
end


