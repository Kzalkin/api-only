class SerializableBook < JSONAPI::Serializable::Resource
  type 'books'
  attributes :title, :author
end
