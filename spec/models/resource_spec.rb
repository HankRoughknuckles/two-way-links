require 'rails_helper'

describe Resource, type: :model do
  describe 'links' do
    context 'when the resource does not link to anything' do
      resource = FactoryBot.create(:resource)

      it 'should have an array of links that it points to' do
        expect(resource.links).to eq []
      end
    end
  end
end
