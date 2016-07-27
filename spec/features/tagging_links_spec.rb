

feature "tagging links" do
  scenario "adds a tag to a link" do
    visit "/links/new"
    fill_in("title", with: "Google")
    fill_in("url", with: "http://www.google.com")
    fill_in("tags", with: "Search Engine")
    click_button("Submit")

    link = Link.first
    expect(link.tags.map(&:name)).to include("Search Engine")

  end
end
