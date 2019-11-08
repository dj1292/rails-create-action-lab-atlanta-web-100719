class StudentsController < ApplicationController
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new 
    # byebug
  end

  def create
    @student = Student.create(
      {
        first_name: params[:first_name],
        last_name: params[:last_name]
      }
    )
    redirect_to student_path(@student)
  end

  private

  def student_params
    strong_params = params.require(:students).permit(:first_name, :last_name)
  end 

end
