require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the FakeUserDataHelper. For example:
#
# describe FakeUserDataHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end


RSpec.describe FakeUserDataHelper, type: :helper do
  let (:users) { FakeUserDataHelper.get_data }
  it "should return an array containing at least three entries" do
    expect(users.length).to be >= 3
  end
  it "each hash in the array contains the keys first_name, last_name and avatar" do
    users.each do |user|
      expect(user.has_key? 'first_name').to eq(true)
      expect(user.has_key? 'last_name').to eq(true)
      expect(user.has_key? 'avatar').to eq(true)
    end
  end
end
