require 'rails_helper'


feature "Signing in" do
  

  background do
    debate = create(:debate)
  end

  it "visit debate" do
    visit '/debates'
    page.find('#debate_1').trigger(:mouseover)
    #print page.driver.headers
    #result = page.find('#debate_1').trigger(:mouseover)
    #print result
  end

end
