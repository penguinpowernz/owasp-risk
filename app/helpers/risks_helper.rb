module RisksHelper
  def score_desc(risk, scorefunc)
    score = risk.try(scorefunc)
    return "??" if score.nil?
    
    words = case score
    when 0..3
      "LOW"
    when 3..7
      "MEDIUM"
    when 7..Float::INFINITY
      "HIGH"
    else
      "?"
    end

    "#{score} (#{words})"
  end

  def severity_class_name(sev)
    case sev
    when 9
      "white text-danger"
    when 6
      "danger"
    when 4
      "warning"
    when 2
      "primary"
    when 1
      "secondary"
    end
  end

  def severity_desc(risk, scorefunc)
    score = risk.try(scorefunc)
    return "??" if score.nil?
    
    words = case score
    when 9
      "CRITICAL"
    when 6
      "HIGH"
    when 4
      "MEDIUM"
    when 2
      "LOW"
    when 1
      "NOTE"
    else
      "INCOMPLETE"
    end

    "#{words}"
  end

  def score_class(risk, scorefunc, highlighted=false)
    score = risk.try(scorefunc)
    return "unknown" if score.nil?
    
    klass = score_class_name(score)

    if klass == "warning" && highlighted
      klass+= " text-dark"
    end

    return "bg-#{klass}" if highlighted
    "table-#{klass}"
  end

  def score_class_name(score)
    case score
    when 0..3
      "primary"
    when 3..7
      "warning"
    when 7..Float::INFINITY
      "danger"
    else
      "secondary"
    end
  end

  def score_and_name(x)
    "#{x.try(:score)} - #{x.try(:name)}"
  end

end
