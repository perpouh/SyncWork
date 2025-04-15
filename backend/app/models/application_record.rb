# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
# and is used by all tests in the application.
# This file defines the ApplicationRecord class, which serves as the base class for all models in the application.
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
