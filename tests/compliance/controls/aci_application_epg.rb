content = inspec.profile.file("output.json")
params = JSON.parse(content)


for i in params['aci_epg-names']['value']
  epg_id = i[0]
  epg_name = i[1]
  tenant_name = params['aci_epg-tenant']['value'][epg_id]
  profile_name = params['aci_epg-ap']['value'][epg_id]
  control epg_name do
    title "ACI EPG Test"
    describe aci_application_epg(name:epg_name,tenant:tenant_name,profile:profile_name) do
      it { should exist }
    end
  end
end
