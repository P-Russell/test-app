require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures first_name presence' do
      user = User.new(last_name: 'name', avatar: 'url to avatar').save
      expect(user).to eq(false)
    end
    it 'ensures last_name presence' do
      user = User.new(first_name: 'name', avatar: 'url to avatar').save
      expect(user).to eq(false)
    end
    it 'ensures avatar presence' do
      user = User.new(first_name: 'first',  last_name: 'name').save
      expect(user).to eq(false)
    end
    it 'should save sucessfully' do
      user = User.new(first_name: 'first', last_name: 'name', avatar: 'url to avatar').save
      expect(user).to eq(true)
    end
  end
  context 'scope tests' do
  end
end
