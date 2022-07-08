require "rails_helper"

RSpec.describe ReservationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/reservations").to route_to("reservations#index")
    end

    it "routes to #create" do
      expect(post: "/reservations").to route_to("reservations#create")
    end

    it "routes to #destroy" do
      expect(delete: "/reservations/1").to route_to("reservations#destroy", id: "1")
    end
  end
end
