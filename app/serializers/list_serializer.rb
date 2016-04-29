class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :user, :permissions
end
