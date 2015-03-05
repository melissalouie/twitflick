require 'rails_helper'

describe 'User can CRUD TV Shows' do
  before :each do
    User.create(username: 'missy', email: 'missy@mail.com', password: 'password', bio: 'tester', admin: 'true')
    visit '/login'
    fill_in 'email', with: 'missy@mail.com'
    fill_in 'password', with: 'password'
    click_on 'Login'
    click_on 'TV Shows'
    Genre.create(name: 'Comedy')
    click_on 'New Show'
    fill_in 'tv_show[title]', with: 'Friends'
    select('Comedy', :from => 'tv_show[genre_id]')
    click_on 'Create Tv show'

  end

  scenario 'User can create tv show' do
    expect(page).to have_content('Friends')
  end

  scenario 'User can edit tv show' do
    click_on 'Edit Show'
    fill_in 'tv_show[title]', with: 'Seinfeld'
    click_on 'Update Tv show'
    expect(page).to have_content('Seinfeld')
  end

  scenario 'User can delete tv show' do
    click_on 'Delete Show'
    expect(page).to have_no_content('Friends')
  end
end
