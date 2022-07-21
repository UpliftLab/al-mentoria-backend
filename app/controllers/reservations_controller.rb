class ReservationsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_reservation, only: %i[destroy]

  # GET /reservations
  def index
    @reservations = current_user.reservations.includes(:mentor, :user, :topic).as_json(
      only: %i[id date],
      include: {
        mentor: {
          only: %i[name photo bio]
        },
        user: {
          only: %i[id name]
        },
        topic: {
          only: %i[label icon]
        }
      }
    )
    render json: { data: @reservations }
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      render json: { data: @reservation }, status: :created, location: @reservation
    else
      render json: { error: create_error('', details: @reservation.errors) }, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    if @reservation.present?
      if @reservation.destroy
        render status: :no_content
      else
        render json: { error: create_error('', details: @reservation.errors) }, status: :unprocessable_entity
      end
    else
      render status: :not_found
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find_by(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.permit(:date, :mentor_topic_id)
  end
end
