Puppet::Type.newtype(:logstash_config_fragment) do

  @doc = "Create a file fragment to be used by logstash_config.
    the `logstash_config_fragment` type creates a file fragment to be collected by logstash_config based on the tag.
    The example is based on exported resources.
  "

  newparam(:name, :namevar => true) do
    desc "Unique name"
  end

  newparam(:content) do
    desc "Content"
  end

  newparam(:order) do
    desc "Order"
    defaultto '10'
    validate do |val|
      fail Puppet::ParseError, "only integers > 0 are allowed and not '#{val}'" if val !~ /^\d+$/
    end
  end

  newparam(:tag) do
    desc "Tag name to be used by file_concat to collect all file_fragments by tag name"
  end

  validate do
    # think up some validation
  end

end
