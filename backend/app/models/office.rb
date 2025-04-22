# frozen_string_literal: true

# This file is part of the Project Management System.
# It is subject to the license terms in the LICENSE file found in the top-level directory of this distribution and at
#
class Office < ApplicationRecord
  has_many :users, dependent: :nullify
end
