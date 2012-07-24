module Ironfan
  class Provider

    class Ec2 < Ironfan::IaasProvider
      field :types,     Array,  :default => 
        [ :instances, :ebs_volumes, :elastic_ips, :key_pairs,
          :placement_groups, :security_groups ]
      field :discover,  Array,  :default => [ :instances ]

      collection :instances,            Ironfan::Provider::Ec2::Instance
      collection :ebs_volumes,          Ironfan::Provider::Ec2::EbsVolume
      collection :elastic_ips,          Ironfan::Provider::Ec2::ElasticIp
      collection :key_pairs,            Ironfan::Provider::Ec2::KeyPair
      collection :placement_groups,     Ironfan::Provider::Ec2::PlacementGroup
      collection :security_groups,      Ironfan::Provider::Ec2::SecurityGroup

      def initialize(*args,&block)
        super
        @ebs_volumes =          Ironfan::Provider::Ec2::EbsVolumes.new
        @elastic_ips =          Ironfan::Provider::Ec2::ElasticIps.new
        @instances =            Ironfan::Provider::Ec2::Instances.new
        @key_pairs =            Ironfan::Provider::Ec2::KeyPairs.new
        @placement_groups =     Ironfan::Provider::Ec2::PlacementGroups.new
        @security_groups =      Ironfan::Provider::Ec2::SecurityGroups.new
      end

      def create_dependencies!(machines)
        targets = [ ebs_volumes, key_pairs, security_groups ]
        delegate_to targets, :create! => machines
      end

      def create_instances!(machines)
        delegate_to instances, :create! => machines
      end

      def save!(machines)
        targets = [ instances, ebs_volumes, security_groups ]
        delegate_to targets, :save! => machines
      end

      def load!(machines)
        targets = [ instances, ebs_volumes ]
        delegate_to targets, :load! => machines
      end
      def correlate!(machines)
      end
      def validate!(machines)
      end

      #
      # Utility functions
      #
      def self.connection
        @@connection ||= Fog::Compute.new({
          :provider              => 'AWS',
          :aws_access_key_id     => Chef::Config[:knife][:aws_access_key_id],
          :aws_secret_access_key => Chef::Config[:knife][:aws_secret_access_key],
          :region                => Chef::Config[:knife][:region]
        })
      end

      # Ensure that a fog object (instance, volume, etc.) has the proper tags on it
      def self.ensure_tags(tags,fog)
        tags_to_create = tags.reject{|key, val| fog.tags[key] == val.to_s }
        return if tags_to_create.empty?
        Ironfan.step(fog.name,"tagging with #{tags_to_create.inspect}", :green)
        tags_to_create.each do |key, value|
          Chef::Log.debug( "tagging #{fog.name} with #{key} = #{value}" )
          Ironfan.safely do
            config = {:key => key, :value => value.to_s, :resource_id => fog.id }
            connection.tags.create(config)
          end
        end
      end
    end

  end
end