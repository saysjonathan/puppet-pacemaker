require 'puppet/provider/pacemaker'
require 'rexml/document'

Puppet::Type.type(:pcmk_location).provide(:pcmk_location, :parent => Puppet::Provider::Pacemaker) do
  desc 'Pacmaker resource location provider'

  optional_commands :crm => '/usr/sbin/crm'
  
  def self.instances
    instances = []
    cmd = crm 'configure', 'show', 'xml'
    xml = REXML::Document.new(cmd)
    basepath = "//cib/configuration/constraints/rsc_location"
    REXML::XPath.each(xml, basepath) do |e| 
      name = e.attributes['id']
      resource = e.attributes['rsc'] 
      score = REXML::XPath.first(xml, basepath + "[@id='#{name}']/rule").attributes['score']
      attribute = REXML::XPath.first(xml, basepath + "[@id='#{name}']/rule/expression").attributes['attribute']
      operation = REXML::XPath.first(xml, basepath + "[@id='#{name}']/rule/expression").attributes['operation']
      value = REXML::XPath.first(xml, basepath + "[@id='#{name}']/rule/expression").attributes['value']

      property = {
        :name => name,
        :resource => resource,
        :score => score,
        :attribute => attribute,
        :operation => operation,
        :value => value,
      }
      instances << new(property)
    end
    instances
  end

  def create
    debug 'Creating resource %s' % resource[:name]
    crm 'configure', 'location', resource[:name], args
  end

  def destroy
    debug 'Destroying resource %s' % resource[:name]
    crm 'configure', 'delete', resource[:name]
  end

  def exists?
    debug 'Checking status of %s' % resource[:name]
    properties[:ensure] != :absent
  end

  def args
    debug 'Building args for %s' % resource[:name]
    args = [
      resource[:resource],
      'rule',
      "#{resource[:score]}:",
      resource['attribute'],
      resource['operation'],
      resource['value']
    ]
  end
end
