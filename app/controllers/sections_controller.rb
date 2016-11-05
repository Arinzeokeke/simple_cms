class SectionsController < ApplicationController
  layout "admin"
  before_action :confirm_logged_in
  before_action :find_page

  def index
    @sections = @page.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
    #@pages = Page.sorted
    @section_count = Section.count + 1
    
  end

  def create
    @section = Section.new(sections_params)
    #@pages = Page.sorted
    if @section.save
      puts 'saved'
      flash[:notice] = "Page created successfully"
      redirect_to(:action => 'index', :page_id => @page.id)
    else
      @section_count = Section.count + 1
      puts 'not saved'
      render('new')
    end
    
  end

  def edit
    @section = Section.find(params[:id])
    #@pages = Page.sorted
    @section_count = Section.count

  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(sections_params)
      flash[:notice] = "Page updated successfully"
      redirect_to(:action => 'show', :id => @section.id, :page_id => @page.id)
    else
      #@pages = Page.sorted
      @section_count = Section.count
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
    redirect_to(:action => 'index' , :page_id => @page.id)
  end

  private 
  def sections_params
    params.require(:section).permit(:name, :visible, :position, :page_id, :content_type, :content)
  end

  def find_page
    if params[:page_id]
      @page = Page.find(params[:page_id])
    
  end
end
