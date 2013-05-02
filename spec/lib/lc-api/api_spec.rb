require 'spec_helper'
require 'httparty'

describe LcApi::API do
  before(:all) do
    LcApi.base_uri = "http://0.0.0.0:3000/v1/"
    LcApi.key = "6bf76818d8ccdc3c8cbd1b17c614c43f"
  end
  
  describe "#get" do
    it "takes a uri and a hash of options" do
      LcApi::API.get("messages/1", {})
    end
    
    it "returns a category resource if a category resource is requested" do
      results = LcApi::API.get("categories/1", {})
      results.has_key?("id").should eq(true)
      results.has_key?("name").should eq(true)
    end
    
    it "returns a locations resource if a locations resource is requested" do
      results = LcApi::API.get("locations/1", {})
      results.has_key?("id").should eq(true)
      results.has_key?("name").should eq(true)
      results.has_key?("slug").should eq(true)
      results.has_key?("facebook_id").should eq(true)
      results.has_key?("street_1").should eq(true)
      results.has_key?("street_2").should eq(true)
      results.has_key?("state").should eq(true)
      results.has_key?("zip").should eq(true)
      results.has_key?("longitude").should eq(true)
      results.has_key?("latitude").should eq(true)
    end
    
    it "returns a message resource if a message resource is requested" do
      results = LcApi::API.get("messages/1", {})
      results.has_key?("id").should eq(true)
      results.has_key?("title").should eq(true)
      results.has_key?("part").should eq(true)
      results.has_key?("length").should eq(true)
      results.has_key?("series_id").should eq(true)
      results.has_key?("speaker_id").should eq(true)
    end
    
    it "returns a series resource if a series resource is requested" do
      results = LcApi::API.get("series/1", {})
      results.has_key?("id").should eq(true)
      results.has_key?("title").should eq(true)
      results.has_key?("description").should eq(true)
      results.has_key?("hashtag").should eq(true)
      results.has_key?("slug").should eq(true)
      results.has_key?("parts").should eq(true)
      results.has_key?("promo").should eq(true)
      results.has_key?("start_date").should eq(true)
      results.has_key?("end_date").should eq(true)
    end
    
    it "returns a speakers resource if a speakers resource is requested" do
      results = LcApi::API.get("speakers/1", {})
      results.has_key?("id").should eq(true)
      results.has_key?("name").should eq(true)
      results.has_key?("bio").should eq(true)
      results.has_key?("org_url").should eq(true)
      results.has_key?("org_name").should eq(true)
      results.has_key?("personal_url").should eq(true)
    end
    
    it "returns a staff resource if a staff resource is requested" do
      results = LcApi::API.get("staff/1", {})
      results.has_key?("id").should eq(true)
      results.has_key?("name").should eq(true)
      results.has_key?("role").should eq(true)
      results.has_key?("email").should eq(true)
      results.has_key?("facebook_id").should eq(true)
      results.has_key?("location_id").should eq(true)
    end
    
    it "returns speakers and series with a messages resource if that is requested" do
      results = LcApi::API.get("messages/1", {:includes => [:speakers, :series]})
      # test includes here (once it is implemented)
    end
  end

end