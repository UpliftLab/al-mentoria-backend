class MentorsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  load_and_authorize_resource except: %i[index show]

  before_action :set_mentor, only: %i[show destroy]

  # GET /mentors
  def index
    @mentors = Mentor.all.as_json(include: :mentor_topics)

    render json: { data: @mentors }
  end

  # GET /mentors/1a
  def show
    render json: { data: @mentor }
  end

  # POST /mentors
  def create
    @mentor = Mentor.new(mentor_params)
    @mentor.user = current_user

    if @mentor.save
      render json: { data: @mentor }, status: :created, location: @mentor
    else
      render json: { error: create_error(
        'Mentor creation failed!',
        details: @mentor.errors
      ) }, status: :unprocessable_entity
    end
  end

  # DELETE /mentors/1
  def destroy
    if @mentor.reservations.present?
      render json: { error: 'There are reservations for this mentor!' }, status: :conflict
    elsif @mentor.destroy
      render status: :no_content
    else
      render json: { error: "Couldn't delete!" }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mentor
    @mentor = Mentor.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def mentor_params
    params.require(:mentor).permit(:photo, :name, :bio)
  end
end
