
def sign_up
  visit '/users/new'

  fill_in :email, with: 'mat@example.com'
  fill_in :password, with: 'tiddles'
  click_button 'Submit'
end
