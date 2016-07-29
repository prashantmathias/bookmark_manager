feature 'User sign up' do

  scenario  'can sign up as a new user' do
      expect { sign_up }.to change(User, :count).by(1)
      expect(page).to have_content('Welcome, user101@email.com')
      expect(User.first.email).to eq('user101@email.com')
  end

  scenario 'User passwords have to match' do
    expect { sign_up(confirm_password: "1234abcd") }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Passwords do not match'
  end

end
