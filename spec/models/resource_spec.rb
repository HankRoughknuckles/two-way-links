require 'rails_helper'

describe Resource, type: :model do
  let!(:resource) { FactoryBot.create(:resource) }

  describe 'links' do
    context 'when the resource does not link to anything' do
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

  describe '#create_target_link_to' do
    let(:url) { 'http://www.target.com/target' }
    let(:target) { Resource.find_or_create_by_url(url) }

    subject { resource.create_target_link_to(target) }

    it 'should add a resource to this resource\'s targets' do
      expect { subject }.to change { resource.targets.count }.by(1)
    end

    describe 'when the resource has not been documented before' do
      it 'should create a new resource in the db' do
        expect { subject }.to change { Resource.count }.by 1
      end

      it 'should also register the website the new resource belongs to' do
        expect{ subject }.to change { Website.count }.by 1
      end
    end

    describe 'when the resource already exists in the db' do
      before :each do
        Resource.find_or_create_by_url(url)
      end

      it 'should add the target to the list of this resource\'s targets' do
        expect { subject }.to change { resource.targets.count }.by(1)
      end

      it 'should not create a new resource in the database' do
        expect{ subject }.not_to change { Resource.count }
      end
    end

    describe 'when its already been called with this resource and target' do
      before :each do
        resource.create_target_link_to(target)
      end

      it 'should not re-add the target' do
        expect{ subject }.not_to change { resource.targets.count }
      end
    end
  end
end
