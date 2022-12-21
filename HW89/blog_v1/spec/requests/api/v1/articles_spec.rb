require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'api/v1/articles', type: :request do
  let(:article) { Article.first }
  let(:author) { Author.first }
  let(:tags) { Tag.first }

  path '/api/v1/articles' do
    get('list articles') do
      tags 'Articles'
      consumes 'application/json'

      parameter name: :search, in: :query, schema: { type: :string },
                description: 'Find an article by title or content that contains text'
      parameter name: :status, in: :query, schema: { type: :string, enum: %w[unpublished published] },
                description: 'Get articles with status: unpublished/published'
      parameter name: :tags, in: :query, schema: { type: :string },
                description: 'Filter articles by tags'
      parameter name: :author, in: :query, schema: { type: :string },
                description: 'Get articles by name author'
      parameter name: :order, in: :query, schema: { type: :string },
                description: 'Sort article by asc/desc'

      response(200, 'successful') do
        let(:search) { 't' }
        let(:status) { 'unpublished' }
        let(:tags) { Tag.first.title }
        let(:author) { Author.first.name }
        let(:order) { 'asc' }

        it 'returns status 200' do
          expect(response).to have_http_status(:ok)
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create article') do
      tags 'Articles'
      consumes 'application/json'
      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string },
          author_id: { type: :integer }
        },
        required: %w[title body author_id]
      }

      response(201, 'created') do
        let(:article) { Article.create(title: 'Test article', body: 'Text of article', author_id: 1) }

        it 'returns a created status' do
          expect(response).to have_http_status(:created)
        end
        it 'returns body of article' do
          expect(article.body).to eq('Text of article')
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/articles/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'
    let(:id) { article.id }
    get('show article') do
      tags 'Articles'
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update article') do
      tags 'Articles'
      consumes 'application/json'
      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string },
          status: { type: :string, enum: %w[unpublished published] }
        },
        required: false
      }
      response(200, 'successful') do
        describe 'PATCH api/v1/articles{id}' do
          it 'update status article' do
            article.update(status: 'published')
            expect(Article.find_by(status: 'published')).to eq(article)
          end
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update article') do
      tags 'Articles'
      consumes 'application/json'
      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string },
          status: { type: :string, enum: %w[unpublished published] }
        },
        required: false
      }
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete article') do
      tags 'Articles'
      response(200, 'successful') do
        describe 'DELETE api/v1/articles{id}' do
          it 'delete article' do
            article.destroy
            expect(Article.find_by(id: 'id')).to eq(nil)
          end
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
