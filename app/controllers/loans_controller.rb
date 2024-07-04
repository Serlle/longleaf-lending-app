class LoansController < ApplicationController
  def home
    # The 'home' action initializes a new RealEstate object
    @real_estate = RealEstate.new # This object will be used in the form rendered in the home view
  end
end
