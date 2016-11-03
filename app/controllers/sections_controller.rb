class SectionsController < ApplicationController
  layout "admin"
  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
    
  end

  def create
    @section = Section.new(sections_params)
    if @section.save
      puts 'saved'
      flash[:notice] = "Page created successfully"
      redirect_to(:action => 'index')
    else
      puts 'not saved'
      render('new')
    end
    
  end

  def edit
    @section = Section.find(params[:id])

  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(sections_params)
      flash[:notice] = "Page updated successfully"
      redirect_to(:action => 'show', :id => @section.id)
    else
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Page destroyed successfully"
    redirect_to(:action => 'index')
  end

  private 
  def sections_params
    params.require(:section).permit(:name, :visible, :position, :page_id, :content_type, :content)
  end
end
