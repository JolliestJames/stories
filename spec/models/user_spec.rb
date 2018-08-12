require "rails_helper"

RSpec.describe User do
  let(:user) { build(:user) }
  let(:story) { build(:story) }

  describe "initialization" do
    specify { expect(user.username).to eq("Fake_username")}
    specify { expect(user.first_name).to eq("Fake_first") }
    specify { expect(user.last_name).to eq("Fake_last") }
    specify { expect(user.email).to eq("fake@fake.com") }
    specify { expect(user.password).to eq("fake_password") }
    specify { expect(user.avatar).to be_an_instance_of(AvatarUploader) }
  end

  it "knows a user can add a story" do
    user.add_story(story)
    expect(user.stories).not_to be_empty
  end

  describe "validations" do

    it "should validate username presence" do
      expect(user).to validate_presence_of(:username)
    end

    it "should validate email presence" do
      expect(user).to validate_presence_of(:email)
    end

    it "should validate password presence" do
      expect(user).to validate_presence_of(:password)
    end

    it "should validate username length" do
      expect(user).to validate_length_of(:username).
        is_at_least(1).
        is_at_most(50).
        on(:create)
    end

    it "should validate email length" do
      expect(user).to validate_length_of(:email).
        is_at_least(1).
        is_at_most(255).
        on(:create)
    end

    it "should validate password length" do
      expect(user).to validate_length_of(:password).
      is_at_least(7).
      is_at_most(255).
      on(:create)
    end

    it "should allow a valid email format" do
      expect(user).to allow_value("fake@fake.com").for(:email)
    end
    
    it "should not allow an invalid email format" do
      expect(user).not_to allow_value("fake").for(:email)
    end

    it "should validate username uniqueness" do
      expect(user).to validate_uniqueness_of(:username).case_insensitive
    end

    it "should validate email uniqueness" do
      expect(user).to validate_uniqueness_of(:email).case_insensitive
    end

  end

end