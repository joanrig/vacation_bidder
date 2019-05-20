module BucketListItemsHelper

  def items
    @items = BucketListItem.where("user_id = ?", @user.id)
  end

  def dreams
    @dreams = @items.where(vacation_id: [nil, ""]) if @items
  end

  def real
    @real = @items - @dreams
  end

  def vacations
    @real.map {|r| Vacation.find_by_id(r.vacation_id)} if @real
  end
end
