require "yaml"

module Smi::Apis::Specs::V1alpha1
  # HTTPRouteGroup is used to describe HTTP/1 and HTTP/2 traffic.
  # It enumerates the routes that can be served by an application.
  class HTTPRouteGroup
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

      # Routes for inbound traffic
      # Matches []HTTPMatch `json:"matches,omitempty" protobuf:"bytes,3,opt,name=matches"`
      matches: Array(HTTPMatch),
    )
  end

  # HTTPMatch defines an individual route for HTTP traffic
  class HTTPMatch
    YAML.mapping(
      # Name is the name of the match for referencing in a TrafficTarget
      # Name string `json:"name,omitempty" protobuf:"bytes,1,opt,name=name"`
      name: String,

      # Methods for inbound traffic as defined in RFC 7231
      # https://tools.ietf.org/html/rfc7231#section-4
      # Methods []string `json:"methods,omitempty" protobuf:"bytes,1,opt,name=methods"`
      methods: Array(String),

      # PathRegex is a regular expression defining the route
      # PathRegex string `json:"pathRegex,omitempty" protobuf:"bytes,1,opt,name=pathRegex"`
      pathRegex: String,
    )
  end

  # HTTPRouteMethod are methods allowed by the route
  alias HTTPRouteMethod = String

  # HTTPRouteMethodAll is a wildcard for all HTTP methods
  HTTPRouteMethodAll = "*".as(HTTPRouteMethod)
  # HTTPRouteMethodGet HTTP GET method
  HTTPRouteMethodGet = "GET".as(HTTPRouteMethod)
  # HTTPRouteMethodHead HTTP HEAD method
  HTTPRouteMethodHead = "HEAD".as(HTTPRouteMethod)
  # HTTPRouteMethodPut HTTP PUT method
  HTTPRouteMethodPut = "PUT".as(HTTPRouteMethod)
  # HTTPRouteMethodPost HTTP POST method
  HTTPRouteMethodPost = "POST".as(HTTPRouteMethod)
  # HTTPRouteMethodDelete HTTP DELETE method
  HTTPRouteMethodDelete = "DELETE".as(HTTPRouteMethod)
  # HTTPRouteMethodConnect HTTP CONNECT method
  HTTPRouteMethodConnect = "CONNECT".as(HTTPRouteMethod)
  # HTTPRouteMethodOptions HTTP OPTIONS method
  HTTPRouteMethodOptions = "OPTIONS".as(HTTPRouteMethod)
  # HTTPRouteMethodTrace HTTP TRACE method
  HTTPRouteMethodTrace = "TRACE".as(HTTPRouteMethod)
  # HTTPRouteMethodPatch HTTP PATCH method
  HTTPRouteMethodPatch = "PATCH".as(HTTPRouteMethod)
end
