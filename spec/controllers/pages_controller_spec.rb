require 'spec_helper'

describe PagesController do
  render_views
  
  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'home'
      response.should have_selector("title", :content => "Rails.SARS | Home")
    end
  end
  
  describe "GET 'contact" do
    it "should be success" do
      get 'contact'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'contact'
      response.should have_selector("title", :content => "Rails.SARS | Contact")
    end
  end
  
  describe "GET 'help'" do
    it "should be success" do
      get 'help'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'help'
      response.should have_selector("title", :content => "Rails.SARS | Help")
    end
  end
  
  describe "GET 'about'" do
    it "should be success" do
      get 'about'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'about'
      response.should have_selector("title", :content => "Rails.SARS | About")
    end
  end
end