require 'rails_helper'

RSpec.describe "Todos", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario 'Invalid todo name' do
    visit todos_path
    expect(page).to have_content("Incomplete")
    expect(page).to have_content("Complete")
    click_button 'Create Todo'
    expect(page).to have_content("Name can't be blank")
    expect(Todo.count).to eq(0)
  end

  scenario 'Valid todo name' do
    visit todos_path
    expect(page).to have_content("Incomplete")
    expect(page).to have_content("Complete")
    fill_in 'Name', with: 'Buy Banana'
    click_button 'Create Todo'
    expect(page).to have_content("Buy Banana")
    expect(Todo.count).to eq(1)
    expect(Todo.last.name).to eq("Buy Banana")
  end  
end
