# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ironfan"
  s.version = "5.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Infochimps"]
  s.date = "2013-12-11"
  s.description = "Ironfan allows you to orchestrate not just systems but clusters of machines. It includes a powerful layer on top of knife and a collection of cloud cookbooks."
  s.email = "coders@infochimps.com"
  s.extra_rdoc_files = [
    "LICENSE.md",
    "README.md"
  ]
  s.files = [
    ".gitignore",
    ".rspec",
    ".yardopts",
    "CHANGELOG.md",
    "ELB.md",
    "Gemfile",
    "Gemfile.lock",
    "Guardfile",
    "LICENSE.md",
    "README.md",
    "Rakefile",
    "TODO.md",
    "VERSION",
    "chefignore",
    "config/client.rb",
    "config/knife.bash",
    "config/knife.bash.README.md",
    "config/proxy.pac",
    "config/ubuntu10.04-ironfan.erb",
    "config/ubuntu12.04-ironfan.erb",
    "ironfan.gemspec",
    "lib/chef/knife/bootstrap/centos6.2-ironfan.erb",
    "lib/chef/knife/bootstrap/chef-full-ironfan.erb",
    "lib/chef/knife/bootstrap/rhel6.3-ironfan.erb",
    "lib/chef/knife/bootstrap/ubuntu10.04-ironfan.erb",
    "lib/chef/knife/bootstrap/ubuntu12.04-ironfan.erb",
    "lib/chef/knife/cluster_bootstrap.rb",
    "lib/chef/knife/cluster_diff.rb",
    "lib/chef/knife/cluster_kick.rb",
    "lib/chef/knife/cluster_kill.rb",
    "lib/chef/knife/cluster_launch.rb",
    "lib/chef/knife/cluster_list.rb",
    "lib/chef/knife/cluster_proxy.rb",
    "lib/chef/knife/cluster_pry.rb",
    "lib/chef/knife/cluster_show.rb",
    "lib/chef/knife/cluster_ssh.rb",
    "lib/chef/knife/cluster_start.rb",
    "lib/chef/knife/cluster_stop.rb",
    "lib/chef/knife/cluster_sync.rb",
    "lib/chef/knife/ironfan_knife_common.rb",
    "lib/chef/knife/ironfan_script.rb",
    "lib/gorillib/diff.rb",
    "lib/gorillib/nil_check_delegate.rb",
    "lib/gorillib/resolution.rb",
    "lib/ironfan.rb",
    "lib/ironfan/broker.rb",
    "lib/ironfan/broker/computer.rb",
    "lib/ironfan/broker/drive.rb",
    "lib/ironfan/builder.rb",
    "lib/ironfan/deprecated.rb",
    "lib/ironfan/dsl.rb",
    "lib/ironfan/dsl/cloud.rb",
    "lib/ironfan/dsl/cluster.rb",
    "lib/ironfan/dsl/component.rb",
    "lib/ironfan/dsl/compute.rb",
    "lib/ironfan/dsl/ec2.rb",
    "lib/ironfan/dsl/facet.rb",
    "lib/ironfan/dsl/rds.rb",
    "lib/ironfan/dsl/realm.rb",
    "lib/ironfan/dsl/role.rb",
    "lib/ironfan/dsl/server.rb",
    "lib/ironfan/dsl/virtualbox.rb",
    "lib/ironfan/dsl/volume.rb",
    "lib/ironfan/dsl/vsphere.rb",
    "lib/ironfan/headers.rb",
    "lib/ironfan/plugin/base.rb",
    "lib/ironfan/provider.rb",
    "lib/ironfan/provider/chef.rb",
    "lib/ironfan/provider/chef/client.rb",
    "lib/ironfan/provider/chef/node.rb",
    "lib/ironfan/provider/chef/role.rb",
    "lib/ironfan/provider/ec2.rb",
    "lib/ironfan/provider/ec2/ebs_volume.rb",
    "lib/ironfan/provider/ec2/elastic_ip.rb",
    "lib/ironfan/provider/ec2/elastic_load_balancer.rb",
    "lib/ironfan/provider/ec2/iam_server_certificate.rb",
    "lib/ironfan/provider/ec2/keypair.rb",
    "lib/ironfan/provider/ec2/machine.rb",
    "lib/ironfan/provider/ec2/placement_group.rb",
    "lib/ironfan/provider/ec2/security_group.rb",
    "lib/ironfan/provider/rds.rb",
    "lib/ironfan/provider/rds/machine.rb",
    "lib/ironfan/provider/rds/security_group.rb",
    "lib/ironfan/provider/virtualbox.rb",
    "lib/ironfan/provider/virtualbox/machine.rb",
    "lib/ironfan/provider/vsphere.rb",
    "lib/ironfan/provider/vsphere/keypair.rb",
    "lib/ironfan/provider/vsphere/machine.rb",
    "lib/ironfan/requirements.rb",
    "notes/Future-development-proposals.md",
    "notes/Home.md",
    "notes/INSTALL-cloud_setup.md",
    "notes/INSTALL.md",
    "notes/Ironfan-Roadmap.md",
    "notes/Upgrading-to-v4.md",
    "notes/advanced-superpowers.md",
    "notes/aws_servers.jpg",
    "notes/aws_user_key.png",
    "notes/cookbook-versioning.md",
    "notes/core_concepts.md",
    "notes/declaring_volumes.md",
    "notes/design_notes-aspect_oriented_devops.md",
    "notes/design_notes-ci_testing.md",
    "notes/design_notes-cookbook_event_ordering.md",
    "notes/design_notes-meta_discovery.md",
    "notes/ec2-pricing_and_capacity.md",
    "notes/ec2-pricing_and_capacity.numbers",
    "notes/homebase-layout.txt",
    "notes/knife-cluster-commands.md",
    "notes/named-cloud-objects.md",
    "notes/opscode_org_key.png",
    "notes/opscode_user_key.png",
    "notes/philosophy.md",
    "notes/rake_tasks.md",
    "notes/renamed-recipes.txt",
    "notes/silverware.md",
    "notes/style_guide.md",
    "notes/tips_and_troubleshooting.md",
    "notes/walkthrough-hadoop.md",
    "notes/walkthrough-web.md",
    "spec/chef/cluster_bootstrap_spec.rb",
    "spec/chef/cluster_launch_spec.rb",
    "spec/fixtures/ec2/elb/snakeoil.crt",
    "spec/fixtures/ec2/elb/snakeoil.key",
    "spec/fixtures/gunbai.rb",
    "spec/fixtures/gunbai_slice.json",
    "spec/fixtures/knife/knife.rb",
    "spec/integration/minimal-chef-repo/chefignore",
    "spec/integration/minimal-chef-repo/environments/_default.json",
    "spec/integration/minimal-chef-repo/knife/credentials/knife-org.rb",
    "spec/integration/minimal-chef-repo/knife/knife.rb",
    "spec/integration/minimal-chef-repo/roles/systemwide.rb",
    "spec/integration/spec/elb_build_spec.rb",
    "spec/integration/spec/simple_cluster_spec.rb",
    "spec/integration/spec_helper.rb",
    "spec/integration/spec_helper/launch_cluster.rb",
    "spec/ironfan/cluster_spec.rb",
    "spec/ironfan/diff_spec.rb",
    "spec/ironfan/ec2/cloud_provider_spec.rb",
    "spec/ironfan/ec2/elb_spec.rb",
    "spec/ironfan/ec2/security_group_spec.rb",
    "spec/spec_helper.rb",
    "spec/spec_helper/dummy_chef.rb",
    "spec/spec_helper/dummy_diff_drawer.rb",
    "spec/test_config.rb",
    "tasks/chef_config.rake"
  ]
  s.homepage = "http://infochimps.com/labs"
  s.licenses = ["apachev2"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.25"
  s.summary = "Infochimps' lightweight cloud orchestration toolkit, built on top of Chef."
  s.test_files = ["spec/fixtures/gunbai.rb", "spec/fixtures/ec2/elb/snakeoil.key", "spec/fixtures/ec2/elb/snakeoil.crt", "spec/fixtures/gunbai_slice.json", "spec/fixtures/knife/knife.rb", "spec/test_config.rb", "spec/ironfan/ec2/cloud_provider_spec.rb", "spec/ironfan/ec2/elb_spec.rb", "spec/ironfan/ec2/security_group_spec.rb", "spec/ironfan/cluster_spec.rb", "spec/spec_helper.rb", "spec/spec_helper/dummy_chef.rb", "spec/chef/cluster_bootstrap_spec.rb", "spec/chef/cluster_launch_spec.rb", "spec/integration/spec/elb_build_spec.rb", "spec/integration/spec/simple_cluster_spec.rb", "spec/integration/spec_helper.rb", "spec/integration/minimal-chef-repo/chefignore", "spec/integration/minimal-chef-repo/roles/systemwide.rb", "spec/integration/minimal-chef-repo/environments/_default.json", "spec/integration/minimal-chef-repo/knife/credentials/knife-org.rb", "spec/integration/minimal-chef-repo/knife/knife.rb", "spec/integration/spec_helper/launch_cluster.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<chef>, ["~> 10.16"])
      s.add_runtime_dependency(%q<fog>, ["~> 1.2"])
      s.add_runtime_dependency(%q<excon>, ["~> 0.21.0"])
      s.add_runtime_dependency(%q<formatador>, ["~> 0.2"])
      s.add_runtime_dependency(%q<gorillib>, ["~> 0.5.0"])
      s.add_runtime_dependency(%q<rbvmomi>, [">= 0"])
      s.add_runtime_dependency(%q<diff-lcs>, ["~> 1.2.5"])
      s.add_runtime_dependency(%q<json>, ["= 1.5.4"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.8"])
      s.add_development_dependency(%q<yard>, [">= 0.7"])
      s.add_development_dependency(%q<redcarpet>, [">= 2.1"])
      s.add_development_dependency(%q<oj>, [">= 1.2"])
    else
      s.add_dependency(%q<chef>, ["~> 10.16"])
      s.add_dependency(%q<fog>, ["~> 1.2"])
      s.add_dependency(%q<excon>, ["~> 0.21.0"])
      s.add_dependency(%q<formatador>, ["~> 0.2"])
      s.add_dependency(%q<gorillib>, ["~> 0.5.0"])
      s.add_dependency(%q<rbvmomi>, [">= 0"])
      s.add_dependency(%q<diff-lcs>, ["~> 1.2.5"])
      s.add_dependency(%q<json>, ["= 1.5.4"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.8"])
      s.add_dependency(%q<yard>, [">= 0.7"])
      s.add_dependency(%q<redcarpet>, [">= 2.1"])
      s.add_dependency(%q<oj>, [">= 1.2"])
    end
  else
    s.add_dependency(%q<chef>, ["~> 10.16"])
    s.add_dependency(%q<fog>, ["~> 1.2"])
    s.add_dependency(%q<excon>, ["~> 0.21.0"])
    s.add_dependency(%q<formatador>, ["~> 0.2"])
    s.add_dependency(%q<gorillib>, ["~> 0.5.0"])
    s.add_dependency(%q<rbvmomi>, [">= 0"])
    s.add_dependency(%q<diff-lcs>, ["~> 1.2.5"])
    s.add_dependency(%q<json>, ["= 1.5.4"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.8"])
    s.add_dependency(%q<yard>, [">= 0.7"])
    s.add_dependency(%q<redcarpet>, [">= 2.1"])
    s.add_dependency(%q<oj>, [">= 1.2"])
  end
end

