class ContactForm < MailForm::Base
	attribute :name
	attribute :email
	attribute :phone
	attribute :code

	def headers
	{
		:subject => "Lapel Interest",
		:to => "concierge@lapel.co",
		:from => %("#{name} <#{email}>")
	}
	end
end
