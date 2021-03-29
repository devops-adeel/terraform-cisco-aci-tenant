# copyright: 2018, The Authors

title "Terraform Module Integration Test"

control 'control-1.0' do
  impact 1.0
  title 'Cisco ACI Contract: Configure the customer contract'
  desc 'Always specify which port the endpoint should listen.'
  desc 'rationale', 'This ensures that there are no unexpected settings'
  tag 'ssh','cisco','cisco-aci', 'devnet'
  tag cce: 'CCE-27072-8'  #This can be a numbered control you should list out.
  ref 'NSA-RH6-STIG - Section 3.5.2.1', url: 'https://www.nsa.gov/ia/_files/os/redhat/rhel5-guide-i731.pdf'

  describe command('cisco_aci_command') do
    it { should exist }
    its('property') { should eq 'value' }
  end
end

