class AddSwimTypeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :swim_type, foreign_key: true
  end
end
