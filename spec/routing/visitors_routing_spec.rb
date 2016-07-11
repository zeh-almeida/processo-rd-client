require "rails_helper"

RSpec.describe VisitorsController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/visitors").to route_to("visitors#create")
    end
  end
end
