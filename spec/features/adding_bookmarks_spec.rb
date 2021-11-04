feature 'adding a new bookmark' do
  scenario 'a user can add bookmarks' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.bbc.com/')
    fill_in('title', with: 'news')
    click_button('Submit')
    
    expect(page).to have_link('news', href: 'http://www.bbc.com/')
  end
end