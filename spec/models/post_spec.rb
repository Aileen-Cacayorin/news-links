require 'rails_helper'

describe Post do
  it { should have_many :comments }
  it { should validate_presence_of :author }
  it { should validate_presence_of :title }
  it { should validate_presence_of :link }
  it { should validate_presence_of :votes }
  it { should validate_presence_of :score }
end
