class Admin::QuestionsController < Admin::BaseController

  before_action :set_test, only: %i[create new]
  before_action :set_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_quuestion_not_found

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to [:admin, @question]
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to [:admin, @question]
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to admin_test_path(@question.test_id)
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_quuestion_not_found
    render plain: 'Question was not found'
  end

end
