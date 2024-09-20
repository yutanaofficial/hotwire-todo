require 'rails_helper'

RSpec.describe "Todos", type: :system do
  before do
    # puts "Before"
    visit todos_path
    driven_by(:rack_test)
  end

  scenario 'Invalid todo name' do
    click_button 'Create Todo'
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Due date can't be blank")
    expect(Todo.count).to eq(0)
  end

  scenario 'Valid todo name' do
    fill_in 'Subject', with: 'Buy Banana'
    fill_in 'Email', with: 'example@example.com'
    fill_in 'Name', with: 'Buy Banana'
    select '2023', from: 'todo_due_date_1i'
    select 'January', from: 'todo_due_date_2i'
    select '1', from: 'todo_due_date_3i'
    click_button 'Create Todo'
    expect(page).to have_content("Buy Banana")
    expect(Todo.count).to eq(1)
    expect(Todo.last.name).to eq("Buy Banana")
    expect(Todo.last.email).to eq("example@example.com")
    expect(Todo.last.due_date).to eq(Date.new(2023, 1, 1))
  end  

  scenario 'Remove todo' do
    fill_in 'Name', with: 'Buy Banana'
    fill_in 'Subject', with: 'Buy Banana'
    fill_in 'Email', with: 'example@example.com'
    select '2023', from: 'todo_due_date_1i'
    select 'January', from: 'todo_due_date_2i'
    select '1', from: 'todo_due_date_3i'
    click_button 'Create Todo'
    expect(page).to have_content("Buy Banana")
    expect(Todo.count).to eq(1)
    expect(Todo.last.name).to eq("Buy Banana")
    click_button 'Delete'
    expect(Todo.count).to eq(0)
  end

  scenario 'Move todo to complete' do
    fill_in 'Name', with: 'Buy Banana'
    fill_in 'Subject', with: 'Buy Banana'
    fill_in 'Email', with: 'example@example.com'
    select '2023', from: 'todo_due_date_1i'
    select 'January', from: 'todo_due_date_2i'
    select '1', from: 'todo_due_date_3i'
    click_button 'Create Todo'
    expect(page).to have_content("Buy Banana")
    expect(Todo.count).to eq(1)
    expect(Todo.last.name).to eq("Buy Banana")
    click_button 'Mark as complete'
    click_link 'Complete'
    expect(page).to have_content("Buy Banana")
    expect(Todo.last.status).to eq('complete')
  end  
end
