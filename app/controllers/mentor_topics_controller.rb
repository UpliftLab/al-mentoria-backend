class MentorTopicsController < ApplicationController
  before_action :set_mentor_topic, only: %i[ show update destroy ]

  # GET /mentor_topics
  def index
    @mentor_topics = MentorTopic.all

    render json: @mentor_topics
  end

  # GET /mentor_topics/1
  def show
    render json: @mentor_topic
  end

  # POST /mentor_topics
  def create
    @mentor_topic = MentorTopic.new(mentor_topic_params)

    if @mentor_topic.save
      render json: @mentor_topic, status: :created, location: @mentor_topic
    else
      render json: @mentor_topic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mentor_topics/1
  def update
    if @mentor_topic.update(mentor_topic_params)
      render json: @mentor_topic
    else
      render json: @mentor_topic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mentor_topics/1
  def destroy
    @mentor_topic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mentor_topic
      @mentor_topic = MentorTopic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mentor_topic_params
      params.require(:mentor_topic).permit(:rating)
    end
end
