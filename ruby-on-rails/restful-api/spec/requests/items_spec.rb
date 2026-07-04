# frozen_string_literal: true
# rbs_inline: enabled

require 'rails_helper'

RSpec.describe 'Items API' do
  # Initialize the test data
  let(:user) { create(:user) }
  let!(:todo) { create(:todo, user_id: user.id) }
  let!(:items) { create_list(:item, 10, todo_id: todo.id) }

  # Test suite for GET /todos/:todo_id/items
  describe 'GET /todos/:todo_id/items' do
    context 'when todo exists' do
      before do
        get "/todos/#{todo.id}/items", params: {}, headers: valid_headers
      end

      it 'returns all items' do
        expect(json.length).to eq(10)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when todo does not exist' do
      before do
        get '/todos/0/items', params: {}, headers: valid_headers
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find Todo")
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  # Test suite for GET /todos/:todo_id/items/:id
  describe 'GET /todos/:todo_id/items/:id' do
    context 'when todo item exists' do
      before do
        get "/todos/#{todo.id}/items/#{items.first.id}", params: {}, headers: valid_headers
      end

      it 'returns the item' do
        expect(json['id']).to eq(items.first.id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when todo item does not exist' do
      before do
        get "/todos/#{todo.id}/items/0", params: {}, headers: valid_headers
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find Item")
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  # Test suite for PUT /todos/:todo_id/items
  describe 'POST /todos/:todo_id/items' do
    let(:valid_attributes) { { name: 'Visit Narnia', done: false }.to_json }

    context 'when the request attributes are valid' do
      before do
        post "/todos/#{todo.id}/items", params: valid_attributes, headers: valid_headers
      end

      it 'creates a todo item' do
        expect(json['name']).to eq('Visit Narnia')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when a request attribute is invalid' do
      before do
        post "/todos/#{todo.id}/items", params: {}, headers: valid_headers
      end

      it 'returns a validation failure message' do
        expect(response.body).to include("Validation failed: Name can't be blank")
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  # Test suite for PUT /todos/:todo_id/items/:id
  describe 'PUT /todos/:todo_id/items/:id' do
    let(:valid_attributes) { { name: 'Mozart' }.to_json }

    context 'when the item exists' do
      before do
        put "/todos/#{todo.id}/items/#{items.first.id}", params: valid_attributes, headers: valid_headers
      end

      it 'updates the todo item' do
        updated_item = Item.find(items.first.id)
        expect(updated_item.name).to eq('Mozart')
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when the todo item does not exist' do
      before do
        put "/todos/#{todo.id}/items/0", params: valid_attributes, headers: valid_headers
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find Item")
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  # Test suite for DELETE /todos/:id
  describe 'DELETE /todos/:todo_id/items/:id' do
    before do
      delete "/todos/#{todo.id}/items/#{items.first.id}", params: {}, headers: valid_headers
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
