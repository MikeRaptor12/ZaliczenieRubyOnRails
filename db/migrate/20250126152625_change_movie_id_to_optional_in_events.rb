class ChangeMovieIdToOptionalInEvents < ActiveRecord::Migration[6.0]
  def change
    change_column_null :events, :movie_id, true
  end
end
