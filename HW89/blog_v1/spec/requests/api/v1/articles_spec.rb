require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'api/v1/articles', type: :request do
  let(:article) { @article = Article.first }
  #let(:comment) { Comment.first }
  #let(:author) { Author.first }
  #let(:tags) { Tag.first }
          
  path '/api/v1/articles' do
    #let(:author) { Author.create(name: 'Vasy') }
    #let(:article) { Artile.create(title: 'Test article', body: 'Text for article', author_id: author_name.id) }
    #let(:tags) { Tag.create(title: 'testtag') }
    
    #get('list articles') do
      #tags "Articles"
      #consumes 'application/json'

      #parameter name: :search, in: :query, schema: { type: :string },
        #description: 'Find an article by title or content that contains text'
      #parameter name: :status, in: :query, schema: { type: :string, enum: %w[unpublished published] },
        #description: 'Get articles with status: unpublished/published'
      #parameter name: :tags, in: :query, schema: { type: :string },
        #description: 'Filter articles by tags'
      #parameter name: :author, in: :query, schema: { type: :string },
        #description: 'Get articles by name author'
      #parameter name: :order, in: :query, schema: { type: :string },
        #description: 'Sort article by asc/desc' 
      
      #response(200, 'successful') do

        #let(:search) { 'Test' }
        #let(:status) { 'unpublished' }
        #let(:tags) { 'testtag' }
        #let(:author) { 'Msgr. Dot Reichel' }
        #let(:order) { 'asc' }

    #     after do |example|
    #       example.metadata[:response][:content] = {
    #         'application/json' => {
    #           example: JSON.parse(response.body, symbolize_names: true)
    #         }
    #       }
    #     end
    #     run_test!
    #   end
    # end
  
  
    post('create article') do
        tags "Articles"
        consumes "application/json"
        parameter name: :article, in: :body, schema: {
          type: :object,
          properties: {
            title: { type: :string },
            body: { type: :string },
            author_id: { type: :integer },
          },
          required: ["title", "body", "author_id"],
        }
        
        response(201, 'created') do
          let(:article) { { title: 'Test article', body: 'Text of article', author_id: 1 } }
          
          it 'returns a created status' do
            expect(response).to have_http_status(:created)
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
    let(:id) { @article.id }
    get('show article') do
      tags "Articles"
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
      tags "Articles"
        consumes "application/json"
        parameter name: :article, in: :body, schema: {
          type: :object,
          properties: {
            title: { type: :string },
            body: { type: :string },
            status: { type: :string, enum: %w[unpublished published] },
          },
          required: false,
        }
      # response(200, 'successful') do
      #   let(:id) { article.id }

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

    put('update article') do
      tags "Articles"
        consumes "application/json"
        parameter name: :article, in: :body, schema: {
          type: :object,
          properties: {
            title: { type: :string },
            body: { type: :string },
            status: { type: :string, enum: %w[unpublished published] },
          },
          required: false,
        }
      # response(200, 'successful') do
      #   let(:id) { article.id }

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

    delete('delete article') do
      tags "Articles"
      # response(200, 'successful') do
      #   let(:id) { article.id }

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
