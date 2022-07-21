require 'rails_helper'

RSpec.describe Topic, type: :model do
  subject { Topic.new(label: 'Django', icon: 'https://download.logo.wine/logo/Ruby_on_Rails/Ruby_on_Rails-Logo.wine.png') }

  describe 'topic' do
    context 'with valid parameters' do
      it 'should save the topic to the database' do
        expect do
          subject.save
        end.to change(Topic, :count).by(1)
      end
      it 'should save the topic with the correct data' do
        subject.save
        expect(Topic.last.label).to eq('Django')
        expect(Topic.last.icon).to eq('https://download.logo.wine/logo/Ruby_on_Rails/Ruby_on_Rails-Logo.wine.png')
      end
    end
  end

  describe 'label' do
    it 'should not be empty' do
      subject.label = nil
      expect(subject).to_not be_valid
      expect do
        subject.save
      end.to change(Topic, :count).by(0)
    end

    it 'should have a max length of 250' do
      subject.label = 251.times.reduce('') { |t, _i| "#{t}9" }
      expect(subject).to_not be_valid
    end
  end

  describe 'icon' do
    it 'should not be empty' do
      subject.icon = nil
      expect(subject).to_not be_valid
      expect do
        subject.save
      end.to change(Topic, :count).by(0)
    end

    it 'should have a max length of 250' do
      subject.icon = 250.times.reduce('https://download.logo.wine/logo/') { |t, _i| "#{t}9" }
      expect(subject).to_not be_valid
    end

    it 'should be a valid url' do
      subject.icon = 'httx://nodomain.com'
      expect(subject).to_not be_valid
    end
  end
end
