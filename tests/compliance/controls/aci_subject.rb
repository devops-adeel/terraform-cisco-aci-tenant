content = inspec.profile.file("output.json")
params = JSON.parse(content)


for i in params['aci_contract_subject-names']['value']
  subject_id = i[0]
  subject_name = i[1]
  tenant_name = params['aci_contract_subject-tenants']['value'][subject_id]
  contract_name = params['aci_contract_subject-contract']['value'][subject_id]
  control subject_name do
    title "ACI Contract Subject Test"
    describe aci_subject(name:subject_name,tenant:tenant_name,contract:contract_name) do
      it { should exist }
    end
  end
end
