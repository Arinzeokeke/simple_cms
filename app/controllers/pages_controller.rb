class PagesController < ApplicationController
  layout "admin"
  before_action :confirm_logged_in
  before_action :find_subject
  def index
    #@pages = Page.where(:subject_id => @subject.id).sorted
    if @subject
      @pages = @subject.pages.sorted

    else
      @pages = Page.sorted

    end
    
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new({:subject_id => @subject.id})
    @page_count = Page.count + 1
    @subjects = Subject.sorted
    
  end

  def create
    @page_count = Page.count + 1
    @subjects = Subject.sorted
    @page = Page.new(pages_params)
    if @page.save
      puts 'saved'
      flash[:notice] = "Page created successfully"
      redirect_to(:action => 'index', :subject_id => @subject.id)
    else
      puts 'not saved'
      render('new')
    end
    
  end

  def edit
    @page = Page.find(params[:id])
    @page_count = Page.count
    @subjects = Subject.sorted

  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(pages_params)
      flash[:notice] = "Page updated successfully"
      redirect_to(:action => 'show', :id => @page.id, :subject_id => @subject.id)
    else
      @page_count = Page.count
      @subjects = Subject.sorted
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Page destroyed successfully"
    redirect_to(:action => 'index',:subject_id => @subject.id)
  end

  private 
  def pages_params
    params.require(:page).permit(:name, :visible, :position, :subject_id, :permalink)
  end

  def find_subject
    puts "heyiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
    if params[:subject_id]
      puts "hey"
      @subject = Subject.find(params[:subject_id])
    end
  end
end
