class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[destroy]

  # GET /reservations
  def index
    @reservations = Reservation.all.as_json(
      only: [:id, :date],
      include: {
        mentor: {
          only: [:name, :photo, :bio],
        },
        user: {
          only: [:id, :name],
        },
        topic: {
          only: [:label, :icon],
        },
      },
    )
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
    unless @reservation.present?
      render status: :not_found
    else
      if @reservation.destroy
        render status: :no_content
      else
        render json: @reservation.errors, status: :unprocessable_entity
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find_by(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.permit(:date, :user_id, :mentor_topic_id)
  end
end
