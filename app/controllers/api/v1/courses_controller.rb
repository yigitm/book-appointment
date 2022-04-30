class Api::V1::CoursesController < ApplicationController 
  before_action :set_course, only: %i[ show update destroy ]

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
    render json: @course
  end

  # POST /courses
  def create
    @course = Course.new(course_params)
    @course.user_id = current_user.id

    if user_authorized? && @course.save
      render json: @course, status: :created, location: 'courses'
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
    @course.destroy
  end

  def user_authorized?
   return false unless request.headers["Authorization"]
    token = request.headers["Authorization"].split(' ')[1] 
    decoded_token = JWT.decode token, nil, false
    @user = User.find_by(id: decoded_token[0]["user_id"])
    !!@user
  end

  def current_user
    token = request.headers["Authorization"].split(' ')[1]
    decoded_token = JWT.decode token, nil, false
    @user = User.find_by(id: decoded_token[0]["user_id"])
    @user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:course_type, :info, :user_id)
    end
end
