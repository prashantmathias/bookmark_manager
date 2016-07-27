require './app/models/link'

feature 'save links' do
  scenario "adds a site's address to the list of links" do
    visit '/links/new'

    fill_in 'url', with: 'http://www.github.com'
    fill_in 'title', with: 'Github'

    click_button 'Create link'

    within 'ul#links' do
      expect(page).to have_content('Github')
    end
  end
end
