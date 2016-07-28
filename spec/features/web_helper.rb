def sign_up(email: 'mat@example.com',password: 'tiddles', confirm_password: 'tiddles')
  visit '/users/new'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :confirm_password, with: confirm_password
  click_button 'Submit'
end
