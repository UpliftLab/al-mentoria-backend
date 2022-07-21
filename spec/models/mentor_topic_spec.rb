require 'rails_helper'

RSpec.describe MentorTopic, type: :model do
  before(:each) do
    load 'db/seeds.rb'
  end
  subject { MentorTopic.new(mentor: Mentor.first, topic: Topic.last, rating: 3) }

  describe 'mentor_topic' do
    context 'with valid parameters' do
      it 'should save the mentor_topic to the database' do
        expect do
          subject.save!
        end.to change(MentorTopic, :count).by(1)
      end
      it 'should save the mentor_topic with the correct data' do
        subject.save!
        expect(MentorTopic.last.mentor).to eq(Mentor.first)
        expect(MentorTopic.last.topic).to eq(Topic.last)
        expect(MentorTopic.last.rating).to eq(3)
      end
    end
  end

  describe 'mentor' do
    it 'should be an existing entry in the database' do
      subject.mentor = nil
      expect(subject).to_not be_valid
      expect do
        subject.save
      end.to change(MentorTopic, :count).by(0)
    end
  end

  describe 'topic' do
    it 'should be an existing entry in the database' do
      subject.topic = nil
      expect(subject).to_not be_valid
      expect do
        subject.save
      end.to change(MentorTopic, :count).by(0)
    end
  end

  describe 'rating' do
    it 'should not be null' do
      subject.rating = nil
      expect(subject).to_not be_valid
      expect do
        subject.save
      end.to change(MentorTopic, :count).by(0)
    end

    it 'should be to a number between 0 and 5' do
      subject.rating = 5.1
      expect(subject).to_not be_valid
      expect do
        subject.save
      end.to change(MentorTopic, :count).by(0)
    end
  end
end
