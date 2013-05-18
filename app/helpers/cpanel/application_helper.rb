# coding: utf-8
module Cpanel::ApplicationHelper
  def render_recent_collection(collection, empty_message, &block)
    if collection.empty?
      content_tag :p, empty_message, :class => "muted no-message"
    else
      concat(capture(&block))
    end
  end
  
  def show_empty_collection_message(message)
    content_tag :p, message, :class => "muted no-message"
  end
  
end
