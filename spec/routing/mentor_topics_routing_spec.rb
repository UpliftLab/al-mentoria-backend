require 'rails_helper'

RSpec.describe MentorTopicsController, type: :routing do
  before(:each) do
    load 'db/seeds.rb'
  end
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/mentors/1/topics').to route_to('mentor_topics#index', mentor_id: '1')
    end

    it 'routes to #create' do
      expect(post: '/mentors/1/topics').to route_to('mentor_topics#create', mentor_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/mentors/1/topics/1').to route_to(
        'mentor_topics#destroy', mentor_id: '1', id: '1'
      )
    end
  end
end
