content = inspec.profile.file("output.json")
params = JSON.parse(content)


for i in params['aci_contract-names']['value']
  contract_id = i[0]
  contract_name = i[1]
  tenant_name = params['aci_contract-tenants']['value'][contract_id]
  control contract_name do
    title "ACI Contract Test"
    describe aci_contract(name: contract_name, tenant:tenant_name) do
      it { should exist }
    end
  end
end
