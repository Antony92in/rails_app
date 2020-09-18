require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  before :each do
    User.create(email: 'user@example.com', password: 'password')
  end

  it 'sign up user' do
    visit new_user_registration_path
    within('form') do
      fill_in 'Email', with: 'user@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
    end
    click_button 'Sign up'
    expect(page).to have_content 'All users'
  end

  it 'sign in user' do
    visit new_user_session_path
    within('form') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'user@example.com'
    click_on 'My page'
    expect(page).to have_content 'My posts'
  end
end
