require "./spec_helper"
include K8s::Apis::Meta::V1

describe K8s::Apis::Meta::V1 do
  it "meta" do
    typemeta = TypeMeta.from_yaml(<<-END
    	apiVersion: '1'
    	kind: Abc
    	END
    )

    typemeta.kind.should eq("Abc")
  end
end
