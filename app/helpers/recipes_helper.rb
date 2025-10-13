module RecipesHelper
  def difficulty_badge_color(difficulty)
    case difficulty
    when "Easy", "Fácil"
      "success"
    when "Medium", "Medio"
      "warning"
    when "Hard", "Difícil"
      "danger"
    else
      "secondary"
    end
  end
end
