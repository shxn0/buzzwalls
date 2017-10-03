module WallsHelper
  def choose_new_or_edit
    if action_name == "new"
      walls_path
    elsif
      action_name == "edit"
      wall_path
    end
  end
end
