class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[destroy]

  # GET /reservations
  def index
    @reservations = Reservation.all.as_json(include: [:user, :mentor, :topic])
    render json: @reservations
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: @reservation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    if @reservation.destroy
      render json: { message: "Reservation deleted" }, status: 202
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:date, :user_id, :mentor_topic_id)
  end
end
