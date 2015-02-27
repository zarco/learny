require 'rails_helper'

RSpec.describe UrlHelper, :type => :helper do
	describe "Validates url for Facebook" do
		it "without protocol" do
			expect(helper.url_with_protocol("facebook.com/bla")).to eq("http://facebook.com/bla")
	    end
	    it "with protocol" do
	    	expect(helper.url_with_protocol("http://facebook.com/bla")).to eq("http://facebook.com/bla")
	    end
  	end	
  	describe "Validates url for Twitter" do
  		it "with at sign" do
  			expect(helper.url_for_twitter("@nickname")).to eq("http://twitter.com/@nickname")	
  		end
  		it "with user profile only" do
  			expect(helper.url_for_twitter("nickname")).to eq("http://twitter.com/nickname")	
  		end
  		it "with protocol" do
  			expect(helper.url_for_twitter("http://twitter.com/@nickname")).to eq("http://twitter.com/@nickname")
  		end
  	end
  	describe "Validates url for Google Plus" do
  		it "with plus sign" do
  			expect(helper.url_for_google_plus("+nickname")).to eq("http://plus.google.com/+nickname")
  		end
  		it "with protocol" do
  			expect(helper.url_for_google_plus("http://plus.google.com/+nickname")).to eq("http://plus.google.com/+nickname")
  		end
  	end
end