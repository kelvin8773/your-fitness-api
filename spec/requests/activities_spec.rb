require 'rails_helper'

RSpec.describe 'Activities API', type: :request do
  # Initialize the test data
  let!(:user) { create(:user) }
  let!(:activities) { create_list(:activity, 20, user_id: user.id) }
  let(:user_id) { user.id }
  let(:id) { activities.first.id }

  # Test suite for GET /users/:user_id/activities
  describe 'GET /users/:user_id/activities' do
    before { get "/users/#{user_id}/activities" }

    context 'when user exists' do
      it 'resturns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'resturns all user activities' do
        expect(json.size).to eq(20)
      end
    end

    context 'when user does not exists' do
      let(:user_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end

  # Test suit for GET /users/:user_id/activities/:id
  describe 'GET /users/:user_id/activities/:id' do
    before { get "/users/#{user_id}/activities/#{id}" }

    context 'when user activity exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the activity' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when user activity does not exist' do
      let(:id) { 0 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Activity/)
      end
    end
  end

  # Test suit for POST /users/:user_id/activities
  describe 'POST /users/:user_id/activities' do
    let(:valid_attributes) { { kind: 'running', amount: 12 } }

    context 'when request attributes are valid' do
      before { post "/users/#{user_id}/activities", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/users/#{user_id}/activities", params: { amout: 4000 } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Kind can't be blank./)
      end
    end
  end

  # Test suite for PUT /users/:user_id/activities/:id
  describe 'PUT /users/:user_id/activities/:id' do
    let(:valid_attributes) { { kind: 'walking', amount: 6500 } }

    before { put "/users/#{user_id}/activities/#{id}", params: valid_attributes }

    context 'when activity exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the activity' do
        updated_activity = Activity.find(id)
        expect(updated_activity.kind).to match(/walking/)
        expect(updated_activity.amount).to eq(6500)
      end
    end

    context 'when the activity does not exists' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Activity/)
      end
    end
  end

  # Test suite for DELETE /users/:user_id/activities/:id
  describe 'DELETE /users/:user_id/activities/:id' do
    before { delete "/users/#{user_id}/activities/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
