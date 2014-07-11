module Sluggable
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.extend ClassMethods
    base.class_eval do
      to_param
    end  
  end

  module InstanceMethods
    def generate_slug!(slug_type,slug_param)
      the_slug = to_slug(self.slug_param)
      slugger = (slug_type.class).find_by slug: the_slug
      count = 2
      while slugger && slugger != self
        the_slug = append_suffix(the_slug, count)
        slugger = (slug_type.class).find_by slug: the_slug
        count += 1  
      end
      self.slug = the_slug.downcase
    end

    def append_suffix(str, count)
      if str.split('-').last_to != 1
        return str.split('-').slice(0...-1).join('-') + "-" + count.to_s
      else
        return str + "-" + count.to_s
      end
    end

    def to_slug(name)
      str = name.strip
      str.gsub! /\s*[^A-Za-z0-9]\s*/, '-'
      str.gsub /-+/, "-"
      str.downcase
    end
  end

  module ClassMethods; end
end