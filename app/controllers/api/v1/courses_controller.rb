class Api::V1::CoursesController < ApplicationController 
  before_action :set_course, only: %i[ show update ]

  # GET /courses
  def index
    @courses = Course.all
    
    if user_authorized?
      render json: @courses
    else
      render json: { error: 'Invalid API token! User not found.' }, status: :unprocessable_entity
    end
  end

  # GET /courses/1
  def show
    if user_authorized?
      render json: @course.detail
    else
      render json: { error: 'Invalid API token! User not found.' }, status: :unprocessable_entity
    end
  end

  # POST /courses
  def create
    @course = Course.new(course_params.except(:course_name, :summary, :course_id))
    @course.user_id = current_user.id

    if user_authorized? && @course.save
      render json: { course: @course, detail: course_detail }, status: :created, location: 'courses'
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1
  def destroy
    if user_authorized?
      @course = Course.find_by(course_type: course_params[:course_type])
      @course.destroy
      render json: { message: 'Course is deleted!' }, status: :ok, location: 'courses'
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def course_detail
    @detail = Detail.new(course_params.except(:course_type, :info, :user_id))
    @detail.course_id = @course.id
    if @detail.save
      @detail
    else
      'Invalid course details'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:course_type, :info, :course_name, :summary, :user_id)
    end
end
