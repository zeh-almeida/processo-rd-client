require 'rails_helper'

RSpec.describe "Page", type: :request do
  describe "GET /index" do
    it "renders #index" do
      get pages_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /pricing" do
    it "renders #pricing" do
      get pricing_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /about" do
    it "renders #about" do
      get about_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /contact" do
    it "renders #contact" do
      get contact_path
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_visitor_path)
    end
  end
end
