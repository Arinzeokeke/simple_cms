class SubjectsController < ApplicationController

  layout "admin"

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    #instatntiate
    @subject = Subject.new(subject_params)
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
      render("edit")

    end
    
  end

  private 
  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

end
