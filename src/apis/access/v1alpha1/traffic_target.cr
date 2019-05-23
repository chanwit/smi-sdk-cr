require "yaml"
require "../../../helper"

include K8s::Apis::Meta::V1

module Smi::Apis::Access::V1alpha1
  # TrafficTarget associates a set of traffic definitions (rules) with a service identity which is allocated to a group of pods.
  # Access is controlled via referenced TrafficSpecs and by a list of source service identities.
  # * If a pod which holds the referenced service identity makes a call to the destination on one of the defined routes then access
  #   will be allowed
  # * Any pod which attempts to connect and is not in the defined list of sources will be denied
  # * Any pod which is in the defined list, but attempts to connect on a route which is not in the list of the
  #   TrafficSpecs will be denied
  class TrafficTarget
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
      status: {
        type:    Status,
        nilable: ture,
      },

      # Selector is the pod or group of pods to allow ingress traffic
      destination: IdentityBindingSubject,

      # Sources are the pod or group of pods to allow ingress traffic
      sources: Array(IdentityBindingSubject),

      # Rules are the traffic rules to allow (HTTPRoutes | TCPRoute),
      specs: Array(TrafficTargetSpec),
    )
  end

  # TrafficTargetSpec is the TrafficSpec to allow for a TrafficTarget
  class TrafficTargetSpec
    YAML.mapping(
      # Kind is the kind of TrafficSpec to allow
      kind: String,
      # Name of the TrafficSpec to use
      name: String,
      # Matches is a list of TrafficSpec routes to allow traffic for
      matches: Array(String),
    )
  end

  # IdentityBindingSubject is a Kubernetes objects which should be allowed access to the TrafficTarget
  class IdentityBindingSubject
    YAML.mapping(
      # Kind is the type of Subject to allow ingress (ServiceAccount | Group)
      kind: String,
      # Name of the Subject, i.e. ServiceAccountName
      name: String,
      # Namespace where the Subject is deployed
      namespace: String,
      # Port defines a TCP port to apply the TrafficTarget to
      port: String,
    )
  end
end
