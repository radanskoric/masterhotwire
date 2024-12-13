require "sequel/model"

module Models
  # A record for everyone that at least attempted to buy the book.
  # Only once it's been confirmed as paid should the User get access to the book.
  class User < Sequel::Model
    def self.create_or_update(attributes)
      user = self.first(email: attributes[:email])
      if user
        user.update(attributes)
        user
      else
        create(attributes)
      end
    end
  end
end
