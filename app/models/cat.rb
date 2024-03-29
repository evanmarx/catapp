class Cat < ActiveRecord::Base
  attr_accessible :age,
                  :birth_date,
                  :color,
                  :name,
                  :neighborhood,
                  :sex

  def age
    age_in_completed_years(self.birth_date, Date.today)
  end

  def age_in_completed_years (bd, d)
      # Difference in years, less one if you have not had a birthday this year.
      a = d.year - bd.year
      a = a - 1 if (
           bd.month >  d.month or
          (bd.month >= d.month and bd.day > d.day)
      )
      a
  end
end

