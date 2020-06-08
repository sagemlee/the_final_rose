class ContestantsController < ApplicationController
  def show
    @contestant = Contestant.find(params[:contestant_id])
  end
end
