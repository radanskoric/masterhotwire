require "bcrypt"

class User < Sequel::Model
  def self.password_for_string(str) # helper method
    BCrypt::Password.create(str).to_s
  end
end

# Table: users
# ---------------------------------------------------------
# Columns:
#  id            | INTEGER      | PRIMARY KEY AUTOINCREMENT
#  email         | citext       | NOT NULL
#  first_name    | varchar(255) |
#  password_hash | varchar(255) | NOT NULL
#  created_at    | timestamp    |
#  updated_at    | timestamp    |
# Indexes:
#  users_email_index | UNIQUE (email)
# ---------------------------------------------------------
