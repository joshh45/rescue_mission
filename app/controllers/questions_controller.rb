class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new
    end
  end



  def question_params
    params.require(:question).permit(:title, :description)
  end

end
