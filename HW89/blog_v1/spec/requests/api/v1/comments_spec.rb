require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do
  path '/api/v1/articles/{article_id}/comments' do
    parameter name: 'article_id', in: :path, type: :string, description: 'article_id'

    get('list comments') do
      tags 'Comments'
      parameter name: :status, in: :query, schema: { type: :string, enum: %w[unpublished published] },
                description: 'Get comments with status: unpublished/published'
      # response(200, 'successful') do
      #   let(:article_id) { '123' }

      #   after do |example|
      #     example.metadata[:response][:content] = {
      #       'application/json' => {
      #         example: JSON.parse(response.body, symbolize_names: true)
      #       }
      #     }
      #   end
      #   run_test!
      # end
    end

    post('create comment') do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          body: { type: :string },
          author_id: { type: :integer }
        },
        required: %w[body author_id]
      }
      # response(200, 'successful') do
      #   let(:article_id) { '123' }

      #   after do |example|
      #     example.metadata[:response][:content] = {
      #       'application/json' => {
      #         example: JSON.parse(response.body, symbolize_names: true)
      #       }
      #     }
      #   end
      #   run_test!
      # end
    end
  end

  path '/api/v1/articles/{article_id}/comments/{id}' do
    parameter name: 'article_id', in: :path, type: :string, description: 'article_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show comment') do
      tags 'Comments'
      # response(200, 'successful') do
      #   let(:article_id) { '123' }
      #   let(:id) { '123' }

      #   after do |example|
      #     example.metadata[:response][:content] = {
      #       'application/json' => {
      #         example: JSON.parse(response.body, symbolize_names: true)
      #       }
      #     }
      #   end
      #   run_test!
      # end
    end

    patch('update comment') do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          body: { type: :string },
          status: { type: :string, enum: %w[unpublished published] }
        },
        required: false
      }
      # response(200, 'successful') do
      #   let(:article_id) { '123' }
      #   let(:id) { '123' }

      #   after do |example|
      #     example.metadata[:response][:content] = {
      #       'application/json' => {
      #         example: JSON.parse(response.body, symbolize_names: true)
      #       }
      #     }
      #   end
      #   run_test!
      # end
    end

    put('update comment') do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          body: { type: :string },
          status: { type: :string, enum: %w[unpublished published] }
        },
        required: false
      }
      # response(200, 'successful') do
      #   let(:article_id) { '123' }
      #   let(:id) { '123' }

      #   after do |example|
      #     example.metadata[:response][:content] = {
      #       'application/json' => {
      #         example: JSON.parse(response.body, symbolize_names: true)
      #       }
      #     }
      #   end
      #   run_test!
      # end
    end

    delete('delete comment') do
      tags 'Comments'
      # response(200, 'successful') do
      #   let(:article_id) { '123' }
      #   let(:id) { '123' }

      #   after do |example|
      #     example.metadata[:response][:content] = {
      #       'application/json' => {
      #         example: JSON.parse(response.body, symbolize_names: true)
      #       }
      #     }
      #   end
      #   run_test!
      # end
    end
  end
end
