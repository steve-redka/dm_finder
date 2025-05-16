require 'rails_helper'

RSpec.describe JoinRequest, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:game) }
  it { should validate_presence_of(:message) }
  it { should validate_length_of(:message).is_at_least(5) }
  it { should validate_inclusion_of(:status).in_array(%w[pending accepted rejected]) }
end