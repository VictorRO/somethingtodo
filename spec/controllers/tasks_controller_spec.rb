require 'rails_helper'

RSpec.describe TasksController do
  describe 'GET #index' do
    context 'when the user is not logged in' do
      it 'requires login' do
        get :index
        expect(response).to redirect_to login_url
      end
    end
  end
end
