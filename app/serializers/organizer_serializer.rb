class OrganizerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :age, :password_digest
end
