require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before(:each) do
    load 'db/seeds.rb'
  end
  subject { Reservation.new(user: User.second, mentor_topic: MentorTopic.last, date: Time.now.to_date) }

  describe 'reservation' do
    context 'with valid parameters' do
      it 'should save the reservation to the database' do
        expect do
          subject.save!
        end.to change(Reservation, :count).by(1)
      end
      it 'should save the reservation with the correct data' do
        subject.save
        expect(Reservation.last.user.name).to eq(User.second.name)
        expect(Reservation.last.mentor_topic.topic.label).to eq(MentorTopic.last.topic.label)
        expect(Reservation.last.date).to eq(Time.now.to_date)
      end
    end
  end

  describe 'user' do
    it 'should be an existing entry in the database' do
      subject.user = nil
      expect(subject).to_not be_valid
      expect do
        subject.save
      end.to change(Reservation, :count).by(0)
    end
  end

  describe 'mentor_topic' do
    it 'should be an existing entry in the database' do
      subject.mentor_topic = nil
      expect(subject).to_not be_valid
      expect do
        subject.save
      end.to change(Reservation, :count).by(0)
    end
  end

  describe 'date' do
    it 'should not be null' do
      subject.date = nil
      expect(subject).to_not be_valid
      expect do
        subject.save
      end.to change(Reservation, :count).by(0)
    end

    it 'should be a valid date string' do
      subject.date = 'asdgb'
      expect(subject).to_not be_valid
      expect do
        subject.save
      end.to change(Reservation, :count).by(0)
    end

    it 'should be a future date' do
      subject.date = '10/07/2022'.to_date
      expect(subject).to_not be_valid
      expect do
        subject.save
      end.to change(Reservation, :count).by(0)
    end
  end
end
