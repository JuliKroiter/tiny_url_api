require 'rails_helper'

RSpec.describe TinyUrls::CreateService do
  subject(:service) { described_class.new(url).call }

  context 'when url present' do
    let(:url) { 'LongUrl' }

    it 'is check short_url' do
      expect(service[:short_url]).to be_present
    end
  end

  context 'when url blank' do
    let(:url) { '' }

    it 'is check errors' do
      expect(service[:errors]).to be_present
    end
  end
end
