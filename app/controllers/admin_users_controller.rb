class AdminUsersController < ApplicationController
	before_action :confirm_logged_in
	layout "admin"
  def index
  	@admins = AdminUser.sorted
  end

  def new
  	@admin = AdminUser.new
  end

  def create
  	@admin = AdminUser.new(admin_params)

  	if @admin.save
  		flash[:notice] = "Admin created successfully"
      	redirect_to(:action => 'index')
    else
    	render('new')
    end

  	
  end

  def edit
  	@admin = AdminUser.find(params[:id])
  end

  def update
  	@admin = AdminUser.find(params[:id])
	if @admin.update_attributes(admin_params)
		flash[:notice] = "Page updated successfully"
      	redirect_to(:action => 'index')

	else
		render("edit")
	end

  end


  def delete
  	@admin = AdminUser.find(params[:id])

  end

  def destroy
  	@admin = AdminUser.find(params[:id])
  	@admin.destroy
  	flash[:notice] = "Admin User destroyed successfully"
  	redirect_to(:action => "index")
  end

  private 
  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :email, :username, :password)
  end
end
