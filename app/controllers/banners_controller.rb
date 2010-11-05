class BannersController < ApplicationController

  def show
    b = banner.find(params[:id])
    b.clicks_count += 1
    b.save!
    redirect_to b.target_url
  end

end
