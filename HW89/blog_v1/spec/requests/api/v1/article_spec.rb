require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'api/v1/articles', type: :request do
  context 'GET /api/v1/articles' do
    before do
      get api_v1_articles_path
    end
    it "responds with ok status" do
      expect(response).to have_http_status(200)
    end

    it 'responds body' do
      expect(response.body).to include('All articles')
    end
  end
end