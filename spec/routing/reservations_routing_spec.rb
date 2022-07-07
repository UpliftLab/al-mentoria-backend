require "rails_helper"

RSpec.describe ReservationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/reservations").to route_to("reservations#index")
    end

    it "routes to #show" do
      expect(get: "/reservations/1").to route_to("reservations#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/reservations").to route_to("reservations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/reservations/1").to route_to("reservations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/reservations/1").to route_to("reservations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/reservations/1").to route_to("reservations#destroy", id: "1")
    end
  end
end
