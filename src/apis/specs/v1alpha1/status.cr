module Smi::Apis::Specs::V1alpha1
  # Status of the resource
  alias Status = String

  # StatusPending is set when the resource is pending creation
  StatusPending = "Pending".as(Status)
  # StatusCreated is set when the resource has been successfully created
  StatusCreated = "Created".as(Status)
  # StatusError is set when a fatal error has occured during the creation of
  # the resource
  StatusError = "Error".as(Status)
end
