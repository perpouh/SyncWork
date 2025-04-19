# frozen_string_literal: true

# == Schema Information
#
# Table name: projects
#
#  id           :string(255)       not null, primary key
#  project_name :string(255)       not null
#  description  :text(65535)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_projects_on_id  (id) UNIQUE
class Project < ApplicationRecord
  validates :id, presence:   true,
                 uniqueness: true,
                 format:     { with: /\A[A-Z0-9_]*\z/, message: 'must contain only /\A[A-Z0-9_]\z/' },
                 length:     { maximum: 15 }
  validates :project_name, presence: true
  validates :description,  presence: true
end
