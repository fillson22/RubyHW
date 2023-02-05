require 'swagger_helper'
require 'rails_helper'

RSpec.describe Api::V1::AuthorsController, type: :controller do
  context 'GET /api/v1/authors' do
    before do
      get :index
    end
    it "responds with ok status" do
      expect(response).to have_http_status(200)
    end

    it 'responds body' do
      expect(response.body).to include('List of authors')
    end
  end
end