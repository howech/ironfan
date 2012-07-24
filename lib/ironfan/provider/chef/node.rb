module Ironfan
  class Provider
    class ChefServer

      class Node < Ironfan::Provider::Resource
        delegate :[], :[]=, :add_to_index, :apply_expansion_attributes,
            :attribute, :attribute=, :attribute?, :automatic_attrs,
            :automatic_attrs=, :cdb_destroy, :cdb_save, :chef_environment,
            :chef_environment=, :chef_server_rest, :class_from_file,
            :construct_attributes, :consume_attributes,
            :consume_external_attrs, :consume_run_list, :cookbook_collection,
            :cookbook_collection=, :couchdb, :couchdb=, :couchdb_id,
            :couchdb_id=, :couchdb_rev, :couchdb_rev=, :create, :default,
            :default_attrs, :default_attrs=, :default_unless,
            :delete_from_index, :destroy, :display_hash, :each,
            :each_attribute, :each_key, :each_value, :expand!, :find_file,
            :from_file, :has_key?, :include_attribute, :index_id, :index_id=,
            :index_object_type, :key?, :keys,
            :load_attribute_by_short_filename, :load_attributes, :name, :node,
            :normal, :normal_attrs, :normal_attrs=, :normal_unless, :override,
            :override_attrs, :override_attrs=, :override_unless, :recipe?,
            :recipe_list, :recipe_list=, :reset_defaults_and_overrides, :role?,
            :run_list, :run_list=, :run_list?, :run_state, :run_state=, :save,
            :set, :set_if_args, :set_or_return, :set_unless, :store, :tags,
            :to_hash, :update_from!, :validate, :with_indexer_metadata,
          :to => :adaptee
        field :client, Ironfan::Provider::ChefServer::Client

        def initialize(config)
          super
          if self.adaptee.nil? and not config[:name].nil?
            self.adaptee = Chef::Node.build(config[:name])
          end
        end

        # matches when node name equals the selector's fullname (strict), or
        #   when name starts with fullname (non-strict)
        def matches_dsl?(selector,options={:strict=>true})
          return false if selector.nil?
          case options[:strict]
          when true;    name == selector.fullname
          when false;   name.match("^#{selector.fullname}")
          end
        end

        def display_values(style,values={})
          values["Chef?"] =     adaptee.nil? ? "no" : "yes"
          values
        end

        def sync!(machine)
          organization =                Chef::Config.organization
          normal[:organization] =       organization unless organization.nil?

          server =                      machine.server
          chef_environment =            server.environment
          run_list.instance_eval        { @run_list_items = server.run_list }
          normal[:cluster_name] =       server.cluster_name
          normal[:facet_name] =         server.facet_name
          normal[:permanent] =          machine.permanent?

          # TODO: delete unless found useful
          machine.resources.each do |resource|
            next unless resource.respond_to? :annotate
            resource.annotate machine
            raise 'hunh'
          end
          save
        end

        def remove!
          self.destroy
          self.owner.delete(self.name)
        end
      end

      class Nodes < Ironfan::Provider::ResourceCollection
        self.item_type =        Node
        self.key_method =       :name

        def discover!(cluster)
          Chef::Search::Query.new.search(:node, "name:#{cluster.name}-*") do |node|
            attrs = {:adaptee => node,:owner => self}
            self << Node.new(attrs) unless node.blank?
          end
        end

        def correlate!(cluster,machines)
          machines.each do |machine|
            if include? machine.server.fullname
              machine[:node] = self[machine.server.fullname]
              machine[:node].users << machine.object_id
            end
          end
        end

        def sync!(machines)
          machines.each do |machine|
            next unless machine.node?
            machine.node.sync! machine
          end
        end

        def validate!(machines)
          machines.each do |machine|
            next unless machine[:node] and not machine[:client]
            machine.bogus << :node_without_client
          end
        end
      end

    end
  end
end
