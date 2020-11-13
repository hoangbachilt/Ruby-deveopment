class MissingParameter < BadRequest
  def message
    I18n.t "errors.params.missing_params"
  end
end
