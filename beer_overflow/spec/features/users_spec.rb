require 'rails_helper'

describe User do
  feature 'Create a Question' do
    scenario 'Should allow user to view the new question page' do
      visit new_question_path
      save_and_open_page
      expect(page).to have_content 'Ask your question below'
    end
  end

 feature 'Visit Signup Page' do
    scenario 'Should allow user to view the signin page' do
      visit signup_path
      save_and_open_page
      expect(page).to have_content 'Password confirmation'
    end
  end
end