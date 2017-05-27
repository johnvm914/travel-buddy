module TripsHelper

  def profile_id(input)
    if input
      profile_id = input.id
    else
      profile_id = 0
    end
  end

end
