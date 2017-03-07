require('spec_helper')

describe('the store route', :type => :feature) do
  it "takes user to the main store page" do
    visit '/'
    click_link 'Go to Stores'
    expect(page).to have_content("You don't have any stores yet.")
  end

  it "allows a user to add a new store" do
    brand = Brand.create({:name => "Molly's Moccasins"})
    visit '/stores'
    fill_in 'name', :with => "Shoe Crazy"
    check "brand_ids[]"
    click_button 'Add Store'
    expect(page).to have_content("Shoe Crazy")
  end

  it "allows a user to edit a store's name" do
    store = Store.create({:name => "Shoe Crazy"})
    brand = Brand.create({:name => "Molly's Moccasins"})
    visit '/stores'
    click_link "Shoe Crazy"
    click_link "Edit"
    fill_in 'name', :with => "Super Shoe Crazy World"
    click_button 'Submit'
    expect(page).to have_content("Super Shoe Crazy World")
  end

  it "allows a user to edit the brands carried by a store" do
    store = Store.create({:name => "Shoe Crazy"})
    brand = Brand.create({:name => "Molly's Moccasins"})
    visit '/stores'
    click_link "Shoe Crazy"
    click_link "Edit"
    check 'brand_ids[]'
    click_button 'Submit'
    expect(page).to have_content("Shoe Crazy")
  end

  it "allows a user to delete a store" do
    store = Store.create({:name => "Shoe Crazy"})
    visit '/stores'
    click_link "Shoe Crazy"
    click_button "Delete"
    expect(page).to have_no_content("Shoe Crazy")
  end
end
