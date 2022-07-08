class MentorsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  load_and_authorize_resource except: %i[index show]

  before_action :set_mentor, only: %i[show destroy]

  # GET /mentors
  def index
    @mentors = Mentor.all

    render json: @mentors
  end

  # GET /mentors/1
  def show
    render json: @mentor
  end

  # POST /mentors
  def create
    @mentor = Mentor.new(mentor_params)

    if @mentor.save
      render json: @mentor, status: :created, location: @mentor
    else
      render json: @mentor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mentors/1
  def destroy
    @mentor.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mentor
    @mentor = Mentor.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def mentor_params
    params.require(:mentor).permit(:user_id, :photo, :name, :bio)
  end
end
