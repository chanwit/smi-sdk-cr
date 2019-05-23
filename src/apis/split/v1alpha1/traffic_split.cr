require "yaml"

module Smi::Apis::Split::V1alpha1
  # TrafficSplit allows users to incrementally direct percentages of traffic
  # between various services. It will be used by clients such as ingress
  # controllers or service mesh sidecars to split the outgoing traffic to
  # different destinations.
  class TrafficSplit
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

      # Specification of the desired behavior of the traffic split.
      # More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
      # +optional
      # Spec TrafficSplitSpec `json:"spec,omitempty" protobuf:"bytes,2,opt,name=spec"`
      spec: {
        type:    TrafficSplitSpec,
        nilable: true,
      }
    )
  end

  # TrafficSplitSpec is the specification for a TrafficSplit
  class TrafficSplitSpec
    YAML.mapping(
      # Service  string                `json:"service,omitempty"`
      service: String,
      # Backends []TrafficSplitBackend `json:"backends,omitempty"`
      backends: Array(TrafficSplitBackend),
    )
  end

  # TrafficSplitBackend defines a backend
  class TrafficSplitBackend
    YAML.mapping(
      # Service string            `json:"service,omitempty"`
      service: String,
      # Weight  resource.Quantity `json:"weight,omitempty"`
      weight: String,
    )
  end
end
