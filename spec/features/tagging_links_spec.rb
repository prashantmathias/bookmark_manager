

feature "tagging links" do

  # before(:each) do
  #   Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
  #   Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
  #   Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
  #   Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
  # end

  scenario "adds a tag to a link" do
    visit "/links/new"
    fill_in("title", with: "Makers Academy")
    fill_in("url", with: "http://www.makersacademy.com")
    fill_in("tags", with: "education")
    click_button("Submit")

    link = Link.first
    expect(link.tags.map(&:name)).to include("education")

  end

  scenario 'checks that the tagged links are filtered' do

    visit '/tags/bubbles'
    expect(page.status_code).to eq(200)
    within 'ul#links' do
     expect(page).not_to have_content('Makers Academy')
     expect(page).not_to have_content('Code.org')
     expect(page).to have_content('This is Zombocom')
     expect(page).to have_content('Bubble Bobble')
    end
  end

  scenario 'adds multiple tags to a link' do
    visit "/links/new"
    fill_in("title", with: "Makers Academy")
    fill_in("url", with: "http://www.makersacademy.com")
    fill_in("tags", with: 'education coding')
    click_button("Submit")

    link = Link.first
    expect(link.tags.map(&:name)).to include('education', 'coding')
  end
end
