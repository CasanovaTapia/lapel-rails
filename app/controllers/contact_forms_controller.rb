class ContactFormsController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    begin
      @contact_form = ContactForm.new(params[:contact_form])
      @contact_form.request = request
      if @contact_form.deliver
        flash[:notice] = 'Your details have been submitted.'
        redirect_to root_path
      else
        render :new
      end
    rescue ScriptError
      flash[:error] = 'Sorry, your details were not submitted.'
    end
  end
end
