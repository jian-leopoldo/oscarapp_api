class CreateUserVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_votes do |t|
      t.integer :movie_id
      t.integer :director_id
      t.integer :user_id

      t.timestamps
    end
  end
end
