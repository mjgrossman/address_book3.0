class Email

  @@all_emails = []

  def initialize(email)
    @email = email
  end

  def email_edit(email)
    @email = email
  end

  def email
    @email
  end

  def Email.all
    @@all_emails
  end

  def save
    @@all_emails << self
  end

  def Email.create(email)
    new_email = Email.new(email)
    new_email.save
    new_email
  end

end
