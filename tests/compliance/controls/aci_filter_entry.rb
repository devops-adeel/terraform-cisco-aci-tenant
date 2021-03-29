content = inspec.profile.file("output.json")
params = JSON.parse(content)


for i in params['aci_filter_entry-names']['value']
  entry_id = i[0]
  entry_name = i[1]
  tenant_name = params['aci_filter_entry-tenants']['value'][entry_id]
  filter_name = params['aci_filter_entry-filter']['value'][entry_id]
  control entry_name do
    title "ACI Filter Entry Test"
    describe aci_filter_entry(name: entry_name,tenant:tenant_name, filter:filter_name) do
      it { should exist }
    end
  end
end
