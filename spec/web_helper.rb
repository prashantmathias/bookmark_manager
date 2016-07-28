require 'spec_helper'

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'user101@email.com'
  fill_in :password, with: 'P@ssw0rd123?'
  click_button 'Sign up'
end
