class MentorTopicsController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource
  before_action :set_mentor_topic, only: %i[destroy]

  def index
    @mentor_topics = Mentor.find(params[:mentor_id]).mentor_topics.as_json(include: %i[mentor topic])

    render json: @mentor_topics
  end

  def create
    @mentor_topic = MentorTopic.new(mentor_topic_params)

    if @mentor_topic.save
      render json: @mentor_topic, status: :created, location: @mentor_topic
    else
      render json: @mentor_topic.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @mentor_topic.nil?
      render status: :not_found
    elsif !@mentor_topic.reservations.empty?
      render status: :conflict
    else
      @mentor_topic.destroy
      render status: :no_content
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mentor_topic
    @mentor_topic = MentorTopic.find_by(id: params[:id])
  end

  def mentor_topic_params
    params.permit(:rating, :topic_id, :mentor_id)
  end
end
