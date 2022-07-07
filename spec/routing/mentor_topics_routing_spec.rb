require "rails_helper"

RSpec.describe MentorTopicsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/mentor_topics").to route_to("mentor_topics#index")
    end

    it "routes to #show" do
      expect(get: "/mentor_topics/1").to route_to("mentor_topics#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/mentor_topics").to route_to("mentor_topics#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/mentor_topics/1").to route_to("mentor_topics#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/mentor_topics/1").to route_to("mentor_topics#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/mentor_topics/1").to route_to("mentor_topics#destroy", id: "1")
    end
  end
end
