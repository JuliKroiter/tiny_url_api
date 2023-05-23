require 'rails_helper'

RSpec.describe TinyUrls::ShowService do
  subject(:service) { described_class.new(tiny_url).call }

  let(:tiny_url) { create(:tiny_url) }

  it 'is check url' do
    expect(service[:url]).to be_present
  end

  it 'is check clicked' do
    service
    expect(tiny_url.reload.clicked).to eql(1)
  end
end
