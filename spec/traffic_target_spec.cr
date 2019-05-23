require "./spec_helper"
include Smi::Apis::Access::V1alpha1

describe Smi::Apis::Access::V1alpha1 do
  it "meta" do
    traffic_target = TrafficTarget.from_yaml(<<-END
    	apiVersion: '1'
    	kind: Abc
    	status: Created
    	END
    )

    traffic_target.kind.should eq("Abc")
  end
end
