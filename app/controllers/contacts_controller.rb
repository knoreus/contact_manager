class ContactsController < ApplicationController
  before_filter :get_contact, :except => [:create, :index, :new]

  def index
    if !current_user.nil?
      @contacts = current_user.contacts
    end
  end

  def new
    @contact = Contact.new
  end

  def copy
    contact = Contact.find(params[:id])
    @contact = contact.dup
    render action: "new"
  end

  def create
    @contact = current_user.contacts.build(params[:contact])
    if @contact.save
      flash[:success] = "Contact created!"
      redirect_to @contact.user, notice: "#{@contact.full_name} was successfully created"
    else
      render action: "new"
    end
  end

  def destroy
    user = @contact.user
    user_name = @contact.full_name
    @contact.destroy
    redirect_to user, notice: "#{user_name} was successfully deleted"
  end

  def edit

  end

   def update
      if @contact.update_attributes(params[:contact])
        redirect_to current_user, notice: "#{@contact.full_name} was successfully updated."
      else
        render action: "edit"
      end
   end

  def show

  end

private
  def get_contact
    @contact = Contact.find(params[:id])
  end

end
