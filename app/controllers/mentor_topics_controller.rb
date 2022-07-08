class MentorTopicsController < ApplicationController
  before_action :set_mentor_topic, only: %i[destroy]

  def index
    @mentor_topics = MentorTopic.all.as_json(include: %i[mentor topic])

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
    @mentor_topic.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mentor_topic
    @mentor_topic = MentorTopic.find(params[:id])
  end

  def mentor_topic_params
    params.permit(:rating, :topic_id, :mentor_id)
  end
end
