class EducationsController < ApiController
  before_action :set_education, only: %i[ show update destroy ]

  # GET /educations
  def index
    @educations = Education.all

    render json: @educations
  end

  # GET /educations/1
  def show
    render json: @education
  end

  # POST /educations
  def create
    @education = Education.new(education_params)

    if @education.save
      render json: @education, status: :created, location: @education
    else
      render json: @education.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /educations/1
  def update
    if @education.update(education_params)
      render json: @education
    else
      render json: @education.errors, status: :unprocessable_entity
    end
  end

  # DELETE /educations/1
  def destroy
    @education.destroy
    render json: {status: "success", message: "Education deleted successfully!"}, status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education
      @education = Education.find_by_id(params[:id])
      render json: {status: "error", message: "Education not found"}, status: :not_found and return unless @education.present?

    end

    # Only allow a list of trusted parameters through.
    def education_params
      params.require(:education).permit(:course_name, :board, :percentage, :passing_year, :branch, :user_id)
    end
end
