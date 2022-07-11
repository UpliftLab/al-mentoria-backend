require 'rails_helper'

RSpec.describe Mentor, type: :model do
  before(:each) do
    load 'db/seeds.rb'
  end
  subject { Mentor.new(user: User.first, name: 'mentorX', bio: 'Hello', photo: 'https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg') }

  describe 'mentor' do
    context 'with valid parameters' do
      it 'should save the mentor to the database' do
        expect do
          subject.save
        end.to change(Mentor, :count).by(1)
      end
      it 'should save the mentor with the correct data' do
        subject.save!
        expect(Mentor.last.user).to eq(User.first)
        expect(Mentor.last.name).to eq('mentorX')
        expect(Mentor.last.bio).to eq('Hello')
        expect(Mentor.last.photo).to eq('https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg')
      end
    end
  end

  describe 'user' do
    it 'should be an existing entry in the database' do
      subject.user = nil
      expect(subject).to_not be_valid
      expect do
        subject.save
      end.to change(Mentor, :count).by(0)
    end
  end

  describe 'name' do
    it 'should not be empty' do
      subject.name = nil
      expect(subject).to_not be_valid
      expect do
        subject.save
      end.to change(Mentor, :count).by(0)
    end

    it 'should have a max length of 250' do
      subject.name = 251.times.reduce('') { |t, _i| "#{t}9" }
      expect(subject).to_not be_valid
    end
  end

  describe 'bio' do
    it 'should not be empty' do
      subject.bio = nil
      expect(subject).to_not be_valid
      expect do
        subject.save
      end.to change(Mentor, :count).by(0)
    end

    it 'should have a max length of 250' do
      subject.bio = 251.times.reduce('') { |t, _i| "#{t}9" }
      expect(subject).to_not be_valid
    end
  end

  describe 'photo' do
    it 'should not be empty' do
      subject.photo = nil
      expect(subject).to_not be_valid
      expect do
        subject.save
      end.to change(Mentor, :count).by(0)
    end

    it 'should have a max length of 250' do
      subject.photo = 251.times.reduce('') { |t, _i| "#{t}9" }
      expect(subject).to_not be_valid
    end

    it 'should have a valid url format' do
      subject.photo = 'httpx://example.com/rocky.png'
      expect(subject).to_not be_valid
    end
  end
end
