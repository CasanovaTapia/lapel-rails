class ContactFormController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    begin
      @contact_form = ContactForm.new(params[:contact_form])
      @contact_form.request = request
      if @contact_form.deliver
        flash.now[:notice] = 'Your details have been submitted.'
      else
        render :new
      end
    rescue ScriptError
      flash[:error] = 'Sorry, your details were not submitted.'
    end
  end
end
