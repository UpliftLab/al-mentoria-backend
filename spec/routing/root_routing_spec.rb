require 'rails_helper'

RSpec.describe 'Root', type: :routing do
  describe 'routing' do
    it 'routes to mentors#index' do
      expect(get: '/').to route_to('mentors#index')
    end
  end
end
