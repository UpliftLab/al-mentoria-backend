require 'rails_helper'

RSpec.describe MentorsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/mentors').to route_to('mentors#index')
    end

    it 'routes to #show' do
      expect(get: '/mentors/1').to route_to('mentors#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/mentors').to route_to('mentors#create')
    end

    it 'routes to #destroy' do
      expect(delete: '/mentors/1').to route_to('mentors#destroy', id: '1')
    end
  end
end
