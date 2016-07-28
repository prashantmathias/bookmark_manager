
feature 'sign up' do
  scenario 'User can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, mat@example.com')
    expect(User.first.email).to eq('mat@example.com')
  end
  scenario "User can't sign up" do

    expect { sign_up(confirm_password: 'anything') }.not_to change(User, :count)
  end
end
