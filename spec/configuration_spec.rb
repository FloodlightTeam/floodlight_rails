require "spec_helper"

module Meerstats
  describe Configuration do
    subject { Meerstats.configuration }

    describe '#access_token' do
      it 'sets value' do
        subject.access_token = '1234'
        expect(subject.access_token).to eq('1234')
      end
    end

    describe '.configure' do
      before do
        Meerstats.configure do |config|
          config.access_token = '4321'
        end
      end

      it 'sets values' do
        expect(subject.access_token).to eq('4321')
      end
    end
  end
end
