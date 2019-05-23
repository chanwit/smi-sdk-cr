require "./spec_helper"
include Smi::Apis::Access::V1alpha1

describe Smi::Apis::Access::V1alpha1 do
  it "status pending" do
    StatusPending.should eq("Pending")
    StatusPending.should eq("Pending".as(Status))
  end

  it "status created" do
    StatusCreated.should eq("Created")
    StatusCreated.should eq("Created".as(Status))
  end

  it "status error" do
    StatusError.should eq("Error")
    StatusError.should eq("Error".as(Status))
  end
end
