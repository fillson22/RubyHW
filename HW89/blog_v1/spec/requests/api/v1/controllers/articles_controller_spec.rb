require 'swagger_helper'
require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :controller do
  context 'GET /api/v1/articles' do
    before do
      get :index
    end
    it "responds with ok status" do
      expect(response).to have_http_status(200)
    end

    it 'responds body' do
      expect(response.body).to include('All articles')
    end
  end
end