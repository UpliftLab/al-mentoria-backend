require 'rails_helper'

RSpec.describe TopicsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/topics').to route_to('topics#index')
    end

    it 'routes to #create' do
      expect(post: '/topics').to route_to('topics#create')
    end

    it 'routes to #destroy' do
      expect(delete: '/topics/1').to route_to('topics#destroy', id: '1')
    end
  end
end
