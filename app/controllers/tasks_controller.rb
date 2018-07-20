class TasksController < ApplicationController
    def index
        @task = Task.new
        @tasks = Task.all.order(created_at: :desc)
    end
     
    def create
       @task = Task.new(tasks_params)
       if @task.save
           redirect_to root_path
       else
           redirect_to root_path
       end
        
    end
# Удаление задачи    
def destroy
  @task = Task.find(params[:id])
  @task.destroy
 
  redirect_to root_path
end
#!!!!!!!!

#Данные загружаються в форму
def edit
    @task = Task.find(params[:id])
end
#!!!!!!!!

#Отвечает за обновление данных
def update
    @task = Task.find(params[:id])
 
    if @task.update(tasks_params)
        redirect_to root_path
    else
        redirect_to root_path
    end
end
#!!!!!!!!
#Обновление свойства 
def done
    @task = Task.find(params[:id])
     
    if(@task)
        @task.status = "true";
 
        redirect_to root_path if @task.save
    else
        redirect_to root_path
    end
end
#!!!!!!


    private
        def tasks_params
            params.require(:task).permit(:title, :text)
        end
end
