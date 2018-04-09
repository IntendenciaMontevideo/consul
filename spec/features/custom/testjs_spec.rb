require 'rails_helper'

feature "Signing in" do
  
  background do
    debate = create(:debate)
  end

  describe 'Testing mouse over comment without log in' do
      
    it "visit debate, whitout log out", :js => true do
      visit '/debates'
      result = page.find('#debate_1_votes').hover
      expect(result.text).to eq "Estoy de acuerdo 0% No estoy de acuerdo 0% Sin votos Necesitas iniciar sesión o registrarte para continuar."
    end
  end

end
