require 'rails_helper'

RSpec.describe GamingSystem, type: :model do
  it "is valid with valid attributes" do
    expect(build(:gaming_system)).to be_valid
  end

  it "is invalid without a name" do
    expect(build(:gaming_system, name: nil)).not_to be_valid
  end

  it "requires name to be unique (case-insensitive)" do
    create(:gaming_system, name: "D&D 5e")
    duplicate = build(:gaming_system, name: "d&d 5E")
    expect(duplicate).not_to be_valid
  end
end
