require "yaml"

module K8s::Apis::Meta::V1
  class TypeMeta
    YAML.mapping(
      kind: String,
      apiVersion: String,
    )
  end
end
