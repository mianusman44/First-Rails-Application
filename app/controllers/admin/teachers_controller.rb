class Admin::TeachersController < AdminController

 

    before_action :set_teacher, only: %i[show edit update destroy]

    def index
        @q=Teacher.ransack(params[:q])
        @teachers=@q.result(distinct: true).page(params[:page])
        
    end

    def new 
        @teacher=Teacher.new
    end

    def create
        @teacher=Teacher.new(teacher_params)
        if @teacher.save
            redirect_to admin_teachers_path,notice:"Student has been created successfully"
        else
            render :new
        end
    end

    def edit 
        # @teacher=Teacher.find(params[:id])
    end

    def update
        # @teacher=Teacher.find(params[:id])
        if @teacher.update(teacher_params)
            redirect_to admin_teachers_path,notice:"Student has been updated successfully"
        else
            render :edit
        end
    end


    def destroy
        # @teacher=Teacher.find(params[:id])
        if @teacher.destroy
            redirect_to admin_teachers_path,notice:"Student has been deleted successfully"
        end
    end


    def show
        # @teacher=Teacher.find(params[:id])
    end

    private  
    def teacher_params
        params.require(:teacher).permit(:first_name,:last_name,:email,:date_of_birth,:profile_image)
    end

    def set_teacher
        @teacher=Teacher.find(params[:id])
    end



end