class SubjectsController < ApplicationController

  layout "admin"
  before_action :confirm_logged_in

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
    @subject_count = Subject.count + 1
  end

  def create
    #instatntiate
    @subject = Subject.new(subject_params)
    @subject_count = Subject.count + 1
    #save
    if @subject.save
      #save success
      flash[:notice] = "Subject created successfully"
      redirect_to(:action => 'index')

    else
      #save failure
      render("new")

    end
   end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  
  end

  def delete
    @subject = Subject.find(params[:id])

  end

  def destroy
    subject = Subject.find(params[:id])
    subject.destroy
    flash[:notice] = "Subject '#{subject.name}' destroy successfully"
    redirect_to(:action => "index")

  end

  def update
    #find
    

    @subject = Subject.find(params[:id])
    #update
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject updated successfully"
      #upsate success
      redirect_to(:action => 'show', :id => @subject.id)

    else
      # failure
      @subject_count = Subject.count
      render("edit")

    end
    
  end

  private 
  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

end
