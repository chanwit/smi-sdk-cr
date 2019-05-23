require "yaml"

module Smi::Apis::Specs::V1alpha1
  # TCPRoute is used to describe TCP inbound connections
  class TCPRoute
    YAML.mapping(
      # TypeMeta
      kind: String,
      apiVersion: String,

      # Standard object's metadata.
      # More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
      # +optional
      metadata: {
        type:    ObjectMeta,
        nilable: true,
      },

      # Most recently observed status of the object.
      # This data may not be up to date.
      # Populated by the system.
      # Read-only.
      # More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
      # +optional
      # Status Status `json:"status,omitempty" protobuf:"bytes,2,opt,name=status"`
      status: {
        type:    Status,
        nilable: true,
      },
    )
  end
end
