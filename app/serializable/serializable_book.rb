class SerializableBook < JSONAPI::Serializable::Resource
  type 'books'
  attribute :title, :author
end
