# aws included via metadata.rb

if node[:ebs_volumes]
  node[:ebs_volumes].each do |name, conf|
    aws_ebs_volume "attach hdfs volume #{conf.inspect}" do
      provider "aws_ebs_volume"
      Chef::Log.info "#{node[:aws][:aws_endpoint_url]} - #{node[:aws][:aws_access_key]} - #{node[:aws][:aws_secret_access_key]}"
      aws_access_key        node[:aws][:aws_access_key]
      aws_secret_access_key node[:aws][:aws_secret_access_key]
      aws_endpoint_url      node[:aws][:aws_endpoint_url]
      availability_zone     node[:aws][:availability_zone]
      volume_id             conf[:volume_id]
      device                conf[:device]
      action :attach
    end
  end
end
