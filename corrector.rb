class Corrector
  def correct_name(name)
    name.split.map(&:capitalize).join(' ')
    if name.length >= 10
      name[0..10].split.map(&:capitalize).join(' ')
    else
      name.split.map(&:capitalize).join(' ')
    end
  end
end
