require 'spec_helper'

describe LcApi::Resource do
  before(:all) do
    LcApi.base_uri = "http://0.0.0.0:3000/v1/"
    LcApi.key = "6bf76818d8ccdc3c8cbd1b17c614c43f"
  end
  
  describe "#member_name" do
    it "extracts and pluralizes the resource name from the resource class passed to it" do
      LcApi::Category.member_name.should eq("categories")
      LcApi::Location.member_name.should eq("locations")
      LcApi::Message.member_name.should eq("messages")
      LcApi::Series.member_name.should eq("series")
      LcApi::Speaker.member_name.should eq("speakers")
      LcApi::Staff.member_name.should eq("staff")
    end
  end
  
  describe "#define_attribute_methods" do
    it "defines the attribute methods passed to it onto the current resource class" do
      message = LcApi::Message.find(1)
      message.attributes.has_key?("title").should eq(true)
      message.attributes.has_key?("series_id").should eq(true)
    end
  end
  
  describe "#find" do
    it "finds a resource passed to it and returns that resource in the form of that resource type" do
      message = LcApi::Message.find(1)
      message.is_a?(LcApi::Message).should eq(true)
    end
  end
  
  describe "#all" do
    it "finds all resources of a given type passed to it and returns that set of resources as that resource type" do
      messages = LcApi::Message.all
      messages.each do |message|
        message.is_a?(LcApi::Message).should eq(true)
      end
    end
  end
  
end