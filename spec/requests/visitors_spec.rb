require 'rails_helper'

RSpec.describe "Visitors", type: :request do
  describe "GET /visitors/new" do
    it "renders #new" do
      get new_visitor_path
      expect(response).to have_http_status(200)
    end
  end
end
