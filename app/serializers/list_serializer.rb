class ListSerializer < ActiveModel::Serializer
  attributes :id, :user, :permissions
end
