# ./models/forms/account.rb

module Forms
  class Account < Lifeform::Form
    fields do
      field rodauth.login_param.to_sym,
            type: :email,
            label: rodauth.login_label,
            required: true,
            autocomplete: "username",
            autofocus: true
      field :name,
            label: "Your Name",
            autocomplete: "name",
            required: true
      field rodauth.password_param.to_sym,
            type: :password,
            label: rodauth.password_label,
            required: true,
            autocomplete: rodauth.password_field_autocomplete_value
      field :submit, type: :submit_button, label: rodauth.login_button
    end
  end
end
