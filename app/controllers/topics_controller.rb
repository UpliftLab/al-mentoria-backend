class TopicsController < ApplicationController
  before_action :set_topic, only: :destroy
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /topics
  def index
    @topics = Topic.all.as_json(only: %i[id label icon])

    render json: { data: @topics }
  end

  # POST /topics
  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      render json: { data: @topic }, status: :created
    else
      render json: { error: create_error('Topic create failed!', details: @topic.errors) },
             status: :unprocessable_entity
    end
  end

  # DELETE /topics/1
  def destroy
    if @topic.reservations.present?
      render json: { error: create_error('There are reservations for this topic!') }, status: :conflict
    elsif @topic.destroy
      render status: :no_content
    else
      render json: { error: create_error("Couldn't delete!") }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_topic
    @topic = Topic.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def topic_params
    params.require(:topic).permit(:label, :icon)
  end
end
