class BucketListItemsController < ApplicationController

  def index
    @bucket = BucketListItem.all
  end

  def new
    @bucket = BucketListItem.new
  end
end
