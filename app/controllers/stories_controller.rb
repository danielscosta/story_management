class StoriesController < ApplicationController
  before_action :authorize

  def initialize
    @users = User.all
  end

  def save
    puts @story

    status = if params[:story][:status] != nil
        params[:story][:status]
      elsif params[:story][:reviewer_id] != "" && params[:story][:writer_id] != ""
        "for_review"
      elsif params[:story][:writer_id] != ""
        "draft"
      else
        "unassigned"
      end

    if params[:story][:id] == nil
      @story = Story.new(headline: params[:story][:headline], organization: current_user.organization, status: status, writer_id: params[:story][:writer_id], reviewer_id: params[:story][:reviewer_id])
      @story.save
    else
      @story = Story.find(params[:story][:id])
      @story.update(body: params[:story][:body], status: status, writer_id: params[:story][:writer_id], reviewer_id: params[:story][:reviewer_id])
    end

    redirect_to "/stories"
  end

  def index
    @stories = Story.all
  end

  def edit
    @story = Story.find(params[:id])
  end
end
