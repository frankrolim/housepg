module MoviesHelper
  def render_imdb_rating(rating)

    rating = rating.to_f
    bg = if rating < 2.0
              "bg-danger"
            elsif rating > 2.0 and rating < 4.0
              "bg-warning"
            elsif rating >= 4.0 and rating < 6.0
              "bg-info"
            elsif rating >= 6.0 and rating < 8.0
              "bg-success"
            elsif rating >= 8.0
              ""
            end

    "<div class=\"progress\">
      <div class=\"progress-bar progress-bar-striped #{bg}\" role=\"progressbar\"
        style=\"width: #{rating*10.0}%\" aria-valuenow=\"#{rating*10.0}\"
        aria-valuemin=\"0\" aria-valuemax=\"100\">#{rating}</div>
    </div>".html_safe
  end
end
