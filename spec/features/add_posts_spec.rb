require 'rails_helper'

describe "the add a list process" do
  it "adds a new post" do
    visit posts_path
    click_on 'Add Post'
    fill_in 'Title', :with => 'News stuff'
    click_on 'Create Post'
    expect(page).to have_content "News Links"
  end

  it "gives error when no title is entered" do
    visit new_post_path
    click_on 'Create Post'
    expect(page).to have_content 'errors'
  end
end
