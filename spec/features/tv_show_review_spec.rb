require 'rails_helper'

describe 'User can CRUD TV Show Reviews' do
   before :each do
     User.create(username: 'missy', email: 'missy@mail.com', password: 'password', admin: true)
     visit '/login'
     fill_in 'email', with: 'missy@mail.com'
     fill_in 'password', with: 'password'
     click_on 'Login'
     Genre.create(name: 'Comedy')
     click_on 'TV Shows'
     click_on 'New Show'
     fill_in 'tv_show[title]', with: 'Friends'
     select('Comedy', :from => 'tv_show[genre_id]')
     click_on 'Create Tv show'
     click_on 'Create Review'
     fill_in 'tv_show_review[review]', with: 'Test Review'
     fill_in 'tv_show_review[rating]', with: '5'
     click_on 'Create Tv show review'
   end

   scenario 'User can create TV Show Review' do
     expect(page).to have_content('Test Review')
   end

   scenario 'User can edit TV Show Review' do
     click_on 'Test Review'
     click_on 'Edit'
     fill_in 'tv_show_review[review]', with: 'Edit Review'
     click_on 'Update Tv show review'
     expect(page).to have_content('Edit Review')
   end

   scenario 'User can delete TV Show Review' do
     click_on 'Test Review'
     click_on 'Delete'
     expect(page).to have_no_content('Test Review')
   end

end
