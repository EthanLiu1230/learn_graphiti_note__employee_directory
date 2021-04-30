require 'rails_helper'

RSpec.describe "milestones#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/milestones", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:milestone)
    end
    let(:payload) do
      {
        data: {
          type: 'milestones',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(MilestoneResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Milestone.count }.by(1)
    end
  end
end
