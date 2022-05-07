# frozen_string_literal: true

module Api
  module V1
    class DetailsController < ApplicationController
      # GET /details
      def index
        @details = Detail.all

        if user_authorized?
          render json: @details
        else
          render json: { error: 'Invalid API token! User not found.' }, status: :unprocessable_entity
        end
      end

      # GET /details/1
      def show
        render json: @detail
      end

      # POST /details
      def create
        @detail = Detail.new(detail_params)

        if @detail.save
          render json: @detail, status: :created, location: @detail
        else
          render json: @detail.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /details/1
      def update
        if @detail.update(detail_params)
          render json: @detail
        else
          render json: @detail.errors, status: :unprocessable_entity
        end
      end

      # DELETE /details/1
      def destroy
        @detail.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_detail
        @detail = Detail.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def detail_params
        params.require(:detail).permit(:course_name, :summary, :course_id)
      end
    end
  end
end
