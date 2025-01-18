# frozen_string_literal: true
require "mail"

class Mailer < Roda
  opts[:root] = File.dirname(__FILE__)

  plugin :render, views: "emails", layout: nil
  plugin :mailer

  route do |r|
    from "Master Hotwire Author <me@radanskoric.com>"

    r.on "users", Integer do |user_id|
      no_mail! unless (@user = Models::User[user_id])

      to @user.email
      bcc "me@radanskoric.com"

      r.mail "purchase" do
        subject "Your copy of Master Hotwire is here!"
        text_part render("purchase.txt")
        if File.exist?(ENV["BOOK_PDF_PATH"])
          add_file(filename: "master-hotwire.pdf", content: File.read(ENV["BOOK_PDF_PATH"]))
        end
      end
    end
  end
end
