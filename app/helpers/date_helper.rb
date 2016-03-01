module DateHelper

  def format(date)
    hour = (date.hour).to_i
    minutes = (date.min).to_i

    dateMeal = (hour * 60) + minutes
    dateNow = DateTime.now.hour * 60 + DateTime.now.min

    res = dateMeal - dateNow

    if res > 180
      false
    else
      true
    end
  end

end
