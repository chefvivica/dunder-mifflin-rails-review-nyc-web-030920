class EmployeesController < ApplicationController

    before_action :find_employee, only: [:show, :update, :edit, :destroy] 
    def index
        @employees = Employee.all 
    end 

    def show
      
    end 

    def new
        @employee = Employee.new
    end 

    def create
        @employee = Employee.create(employee_params)
       
        if @employee.valid?
          redirect_to @employee
        else 
          flash[:errors] = @employee.errors.full_messages
          redirect_to  new_employee_path
        end 
      end 

      def edit
      end 

      def update
        if @employee.update(employee_params)
            redirect_to @employee
        else
            flash[:errors] = @employee.errors.full_messages
          redirect_to  edit_employee_path
        end 
      end 

      def destroy
        @employee.destroy
        redirect_to @employee
      end 


    private 
    
    def find_employee
        @employee = Employee.find(params[:id])
    end 


  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
  end

end
