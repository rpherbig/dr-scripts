
require('yaml')

unless ARGV[0]
  puts 'Please provide at least a character name'
  exit
end

$name = ARGV[0]
$args = ['fake'] + ARGV[1..-1]

def checkname
  $name
end

def variable
  $args
end

module DRC
  class Item
    attr_accessor :name, :is_leather, :is_worn, :hinders_lockpicking, :description, :container, :swappable, :tie_to

    def initialize(name:nil, leather:nil, worn:true, hinders_locks:nil, description:nil, container:nil, swappable:false, tie_to:nil)
      @name = name
      @is_leather = leather
      @is_worn = worn
      @hinders_lockpicking = hinders_locks
      @description = description
      @container = container
      @swappable = swappable
      @tie_to = tie_to
    end
  end
end

def items_to_array(items)
  items.map { |item| { description: item.description, name: item.name, is_leather: item.is_leather, hinders_lockpicking: item.hinders_lockpicking, is_worn: item.is_worn, swappable: item.swappable, tie_to: item.tie_to } }
end

module Vars
  @@vars = {}
  def self.[](name)
    @@vars[name]
  end

  def self.[]=(name, val)
    if val.nil?
      @@vars.delete(name)
    else
      @@vars[name] = val
    end
  end

  def self.list
    @@vars.dup
  end

  def self.method_missing(arg1, arg2 = '')
    if arg1[-1, 1] == '='
      if arg2.nil?
        @@vars.delete(arg1.to_s.chop)
      else
        @@vars[arg1.to_s.chop] = arg2
      end
    else
      @@vars[arg1.to_s]
    end
  end
end

module UserVars
  def self.list
    Vars.list
  end

  def self.method_missing(arg1, arg2 = '')
    Vars.method_missing(arg1, arg2)
  end

  def self.change(var_name, value, _t = nil)
    Vars[var_name] = value
  end

  def self.add(var_name, value, _t = nil)
    Vars[var_name] = Vars[var_name].split(', ').push(value).join(', ')
  end

  def self.delete(var_name, _t = nil)
    Vars[var_name] = nil
  end

  def self.list_global
    []
  end

  def self.list_char
    Vars.list
  end
end

UserVars.box_nouns = %w(coffer strongbox chest caddy trunk casket skippet crate box)

UserVars.gem_nouns = %w(tsavorite zircon quartz chalcedony diopside coral moonstone onyx topaz amber pearl chryso
                        lazuli turquoise bloodstone hematite morganite sapphire agate carnelian diamond crystal emerald
                        ruby tourmaline tanzanite jade ivory sunstone iolite beryl garnet alexandrite amethyst citrine
                        aquamarine star-stone crystal kunzite stones spinel opal peridot andalusite)

UserVars.treasure_nouns = %w(map scroll bark parchment)

UserVars.export = true

def start_script(test = nil, test2 = nil)
end

def running?(_dummy)
  false
end

class StringProc
  def self.new(string)
    string
  end
end

class Proc
  def self.new(string)
    string
  end
end

eval File.read('combat-setup.lic')

result = { 'gear' => items_to_array(UserVars.gear), 'gear_sets' => UserVars.gear_sets }

result.merge!(UserVars.export.list)

UserVars.delete('export')
UserVars.delete('gear')
UserVars.delete('gear_sets')

eval File.read('crossing-setup.lic')

result.merge!(UserVars.list)

File.write("profiles/#{checkname}-setup.yaml"), result.to_yaml)
