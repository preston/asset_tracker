module ApplicationHelper

  def button_link_to(path, options = {})
    options = {:text => 'New', :image => 'icons/add.png', :css => ""}.merge(options)
    render :partial => 'common/button_link', :locals => {:path => path, :image => options[:image], :text => options[:text], :css => options[:class]}  
  end


  def button_function(options = {})
    options = {:container => 'button_function_container', :id => 'button_function_link', :text_hidden => 'Show', :text_shown => 'Hide', :image => 'icons/add.png', :css => ""}.merge(options)
    render :partial => 'common/button_function', :locals => {
      :image => options[:image],
      :id => options[:id],
      :container => options[:container],
      :text_shown => options[:text_hidden],
      :text_hidden => options[:text_shown],
      :css => options[:class]}  
  end


  def button_submit(options = {})
    options = {:text => 'Save', :image => 'icons/disk.png', :css => ""}.merge(options)
    render :partial => 'common/button_submit', :locals => {:image => options[:image], :text => options[:text], :css => options[:class]}  
  end


end
