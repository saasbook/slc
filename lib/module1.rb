module Module1
  def validate_params(model, model_sym, specific_params)
        begin
            specific_params.each do |item|
                if params[model_sym][item] == nil || params[model_sym][item].length == 0
                    throw ArgumentError
                end    
            end
        rescue ArgumentError => e
            flash[:error] = e.message
            if(model_sym == :tutee)
                redirect_to edit_tutee_path(model)
            else
                redirect_to edit_tutor_path(model)
            end    
                
        end    
  end
end