class MentorTopicsController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource
  before_action :set_mentor
  before_action :set_mentor_topic, only: %i[destroy]

  def index
    @mentor_topics = @mentor.mentor_topics.includes(:mentor, :topic).as_json(include: %i[mentor topic])

    render json: { data: @mentor_topics }
  end

  def create
    @mentor_topic = MentorTopic.new(mentor_topic_params)

    if @mentor.mentor_topics.exists?(topic: @mentor_topic.topic)
      render(
        json: {
          error: create_error(
            'Topic already exists for this mentor'
          )
        },
        status: :conflict
      )
      return
    end

    if @mentor_topic.save
      render json: { data: @mentor_topic }, status: :created
    else
      render(
        json: {
          error: create_error(
            'Adding topic for the mentor failed!',
            details: @mentor_topic.errors
          )
        },
        status: :unprocessable_entity
      )
    end
  end

  def destroy
    if @mentor_topic.nil?
      render status: :not_found
    elsif !@mentor_topic.reservations.empty?
      render json: { error: 'There are reservations for this topic!' }, status: :conflict
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

  def set_mentor
    @mentor = Mentor.find_by(id: params[:mentor_id])
  end

  def mentor_topic_params
    params.permit(:rating, :topic_id, :mentor_id)
  end
end
