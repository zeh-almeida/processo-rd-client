require "rails_helper"

RSpec.describe PagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/").to route_to("pages#index")
    end

    it "routes to #about" do
      expect(get: "/about").to route_to("pages#about")
    end

    it "routes to #pricing" do
      expect(get: "/pricing").to route_to("pages#pricing")
    end

    it "routes to #contact" do
      expect(get: "/contact").to route_to("pages#contact")
    end
  end
end
