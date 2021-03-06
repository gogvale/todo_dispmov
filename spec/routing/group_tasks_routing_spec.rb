# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GroupTasksController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/groups/1/group_tasks').to route_to('group_tasks#index')
    end

    it 'routes to #show' do
      expect(get: '/groups/1/group_tasks/1').to route_to('group_tasks#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/groups/1/group_tasks').to route_to('group_tasks#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/groups/1/group_tasks/1').to route_to('group_tasks#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/groups/1/group_tasks/1').to route_to('group_tasks#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/groups/1/group_tasks/1').to route_to('group_tasks#destroy', id: '1')
    end
  end
end
