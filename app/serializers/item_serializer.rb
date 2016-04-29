class ItemSerializer < ActiveModel::Serializer
  attributes :id, :list, :description, :completed
end
