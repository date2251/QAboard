# frozen_string_literal: true

class Good < ApplicationRecord
  belongs_to :user
  belongs_to :answer
end
