content = inspec.profile.file("output.json")
params = JSON.parse(content)


for i in params['aci_filter-names']['value']
  filter_id = i[0]
  filter_name = i[1]
  tenant_name = params['aci_filter-tenants']['value'][filter_id]
  control filter_name do
    title "ACI Filter Test"
    describe aci_filter(name:filter_name,tenant:tenant_name) do
      it { should exist }
    end
  end
end
