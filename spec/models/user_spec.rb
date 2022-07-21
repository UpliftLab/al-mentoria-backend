require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    load 'db/seeds.rb'
  end
  subject { User.new(name: 'Dalinar', email: 'dalinar@roshar.cos', password: '0123456789') }

  describe 'user' do
    context 'with valid parameters' do
      it 'should save the user to the database' do
        expect do
          subject.save
        end.to change(User, :count).by(1)
      end
      it 'should save the user with the correct data' do
        subject.save
        expect(User.last.name).to eq('Dalinar')
        expect(User.last.email).to eq('dalinar@roshar.cos')
      end
    end
  end

  describe 'name' do
    it 'should not be empty' do
      subject.name = nil
      expect(subject).to_not be_valid
      expect do
        subject.save
      end.to change(User, :count).by(0)
    end

    it 'should have a max length of 250' do
      subject.name = 251.times.reduce('') { |t, _i| "#{t}9" }
      expect(subject).to_not be_valid
    end
  end

  describe 'email' do
    it 'should be non empty' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'should be valid email format' do
      subject.email = 'hoid?roshar.cos'
      expect(subject).to_not be_valid
    end
  end

  describe 'password' do
    it 'should be non empty' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'should have at last 6 chars' do
      subject.password = '01234'
      expect(subject).to_not be_valid
    end
  end
end
