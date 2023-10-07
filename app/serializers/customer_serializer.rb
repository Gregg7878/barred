class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :age
  # attributes :id, :first_name, :last_name
end
