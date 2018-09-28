module KittensHelper

  def age(dob)
    return "n/a" if dob.nil?
    days = (Date.today - dob).to_i
    y = (days / 365.25).floor
    m, d = days.divmod(30)

    y_text =           (y == 0) ? nil : (y == 1) ? '1 year'  : "#{y} years"
    m_text =      y && (m == 0) ? nil : (m == 1) ? '1 month' : "#{m} months"
    d_text = y && m && (d == 0) ? nil : (d == 1) ? '1 day' : "#{d} days"

    [y_text, m_text, d_text].compact.join(' and ') + ' old'
  end

end
