require 'spec_helper'

feature 'edges page', js: true do
  scenario 'see the list of all edges' do
    create_list(:edge, 3)
    visit('/#/edges')
    expect(page).to have_css('ul#edges>li', count: 3)
  end
  scenario 'clicking on edge toggles description' do
    create(:edge, name: 'first', description: 'desc1')
    create(:edge, name: 'second', description: 'desc2')    
    visit('/#/edges')
    expect(page).not_to have_content('desc1')
    first('ul#edges>li').click
    expect(page).to have_content('desc1')
    first('ul#edges>li').click
    expect(page).not_to have_content('desc1')
  end
  scenario 'only one description is active' do
    create(:edge, name: 'first', description: 'desc1')
    create(:edge, name: 'second', description: 'desc2')    
    visit('/#/edges')
    
    expect(page).not_to have_content('desc1')
    first('ul#edges>li').click
    expect(page).to have_content('desc1')
    all('ul#edges>li')[2].click
    expect(page).not_to have_content('desc1')
    expect(page).to have_content('desc2')    
  end

  scenario 'search for edge' do
    create(:edge, name: 'first', description: 'desc1')
    create(:edge, name: 'second', description: 'desc2')    
    visit('/#/edges')

    find(:xpath, '//input[@type="search"]').set('fi')
    expect(page).to have_css('ul#edges>li', count: 1)
  end

  scenario 'filtering by category' do
    cat1 = create(:category, name: 'Background')
    cat2 = create(:category, name: 'Combat')    
    create_list(:edge, 3, category: cat1)
    create_list(:edge, 2, category: cat2)
    visit('/#/edges')

    find(:xpath, '//option[contains(text(), "Background")]', 'Background').select_option
    expect(page).to have_css('ul#edges>li', count: 3)
    find(:xpath, '//option[contains(text(), "Combat")]', 'Combat').select_option
    expect(page).to have_css('ul#edges>li', count: 2)
  end

  scenario 'filtering by rank' do
    create_list(:edge, 2)
    edge = create(:edge)
    rank = create(:requirement, mode: 'rank', name: nil, value: 'Novice', edge: edge)
    visit('/#/edges')

    find(:xpath, '//option[contains(text(), "Novice")]', 'Novice').select_option
    expect(page).to have_css('ul#edges>li', count: 1)
  end
  
end
