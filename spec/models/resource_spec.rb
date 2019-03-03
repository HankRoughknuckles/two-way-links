require 'rails_helper'

describe Resource, type: :model do
  describe 'links' do
    context 'when the resource does not link to anything' do
      let(:resource) { FactoryBot.create(:resource) }

      it 'should have no targets' do
        expect(resource.targets).to eq []
      end

      it 'should have no subscribers' do
        expect(resource.subscribers).to eq []
      end
    end

    context 'when the resource links to another resource' do
      let!(:subscriber) { FactoryBot.create(:resource, url: 'subscriber.com') }
      let!(:target) { FactoryBot.create(:resource, url: 'target.com') }
      let!(:link) { FactoryBot.create(:link,
                                     subscriber_id: subscriber.id,
                                     target_id: target.id) }

      it 'subscriber should have target in its list of targets' do
        expect(subscriber.targets).to eq [target]
      end

      it 'target should have subscriber in its list of subscribers' do
        expect(target.subscribers).to eq [subscriber]
      end
    end
  end
end
