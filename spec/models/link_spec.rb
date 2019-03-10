require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:link) { FactoryBot.create(:link) }

  it 'has a target' do
    expect(link).to respond_to :target
  end

  it 'has a subscriber' do
    expect(link).to respond_to :subscriber
  end
end
