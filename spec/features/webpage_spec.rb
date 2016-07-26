require './app/models/link'

feature "Visiting the webpage" do
  scenario "you can see a list of links" do
    Link.create(:title => 'Makers Academy', :url => "http://www.makersacademy.com")
    visit "/links"
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end

end
