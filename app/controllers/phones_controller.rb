class PhonesController < ApplicationController
  def index
    @phones = Cellphone.all
  end
end
