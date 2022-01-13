require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do 
    @category = Category.create! name: "Apparel"

    1.times do |n|
      @category.products.create!(
        name: 'only product', 
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10, 
        price: 64.99
      )
    end
  end

  scenario "Visit the products page and then click on details to take us to the show page" do 

    visit root_path 

    page.find('article footer a').click
    expect(page).to have_text "only product"
    save_screenshot
    end
    
 

end
