class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :phone, :date_of_birth

  validates_presence_of :last_name, :first_name, :email
  validates_format_of :first_name, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_format_of :last_name, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_length_of :first_name, :maximum => 50
  validates_length_of :last_name, :maximum => 50
  validates_length_of :email, :maximum => 200
  validates_uniqueness_of :email
  validates_format_of :phone,
                    :with => /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/,
                    :allow_blank => true,
                    :allow_nil => true
  validates_format_of :date_of_birth,
                      :with => /\A(?:0?[1-9]|1[0-2])\/(?:0?[1-9]|[1-2]\d|3[01])\/\d{4}\Z/,
                      :allow_blank => true,
                      :allow_nil => true


end
