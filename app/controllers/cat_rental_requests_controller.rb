class CatRentalRequestsController < ApplicationController

  def show
    @cat_rental_request = CatRentalRequest.find_by_id(params[:id])
    render :show
  end

  def new
    @cat_rental_request = CatRentalRequest.new
  end

  private
  def cat_rental_requests_params
    params.require(:cat_rental_requests).permit(:cat_id, :start_date, :end_date, :status)
  end
end
