require 'mediashelf/active_fedora_helper'

class GrantsController < ApplicationController
  include MediaShelf::ActiveFedoraHelper
  before_filter :require_solr, :require_fedora
  
  def new
    render :partial=>"grants/edit"
  end
  
  def create
    af_model = retrieve_af_model(params[:content_type], :default => HydrangeaDataset)
    @document_fedora = af_model.find(params[:asset_id])
    inserted_node, new_node_index = @document_fedora.insert_grant
    @document_fedora.save
    logger.info "x"
    logger.info inserted_node
    logger.info new_node_index
    logger.info "x"
    render :partial=>"grants/edit", :locals=>{"edit".to_sym =>inserted_node, "edit_counter".to_sym =>new_node_index}, :layout=>false    
  end
  
  def destroy
    af_model = retrieve_af_model(params[:content_type], :default => HydrangeaDataset)
    @document_fedora = af_model.find(params[:asset_id])
    @document_fedora.remove_grant(params[:grant], params[:index])
    result = @document_fedora.save
    render :text=>result.inspect
  end
  
end