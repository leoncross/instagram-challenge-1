require "helpers/authentication_helper"
require "helpers/post_helper"

feature "Comments" do
  scenario "Can post a comment" do
    sign_up_as_user_a
    upload_cat_picture
    click_link "Comment"
    fill_in "comment_comment", with: "great picture!"
    click_button "submit"
    expect(page).to have_content("great picture!")
  end
  scenario "Can delete a comment" do
    sign_up_as_user_a
    upload_cat_picture
    click_link "Comment"
    fill_in "comment_comment", with: "great picture!"
    click_button "submit"
    expect(page).to have_content("great picture!")
    click_link "Delete"
    expect(page).to_not have_content("great picture!")
  end
  scenario "Can edit a comment" do
    sign_up_as_user_a
    upload_cat_picture
    click_link "Comment"
    fill_in "comment_comment", with: "great picture!"
    click_button "submit"
    expect(page).to have_content("great picture!")
    click_link "Edit"
    fill_in "comment_comment", with: "I prefer dogs!"
    click_button "Update"
    expect(page).to have_content("I prefer dogs!")
  end
end
