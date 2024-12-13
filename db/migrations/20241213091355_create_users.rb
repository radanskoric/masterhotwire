Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id
      String :email, null: false, unique: true
      TrueClass :paid, null: false, default: false
      TrueClass :product_sent, null: false, default: false
      TrueClass :marketing_consent, null: false, default: false
      String :paddle_id
    end
  end
end
