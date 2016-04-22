class Snulion
  def self.get_member
    return @student_member
  end
  def self.make_team(member_number)
    result = []
    remnant = @student_member + ["이재성"]
    while remnant.count > 0
      team = remnant.sample(member_number)
      result << team
      remnant = remnant - team
    end
    return result
  end
  def self.for_member_pic
    return @student_member + ["남형걸","박준호","소윤상","신동민","오주영","이재성","정유철","진향기"]
  end
  private
  @student_member = ["김경도","김권봉","김근영","김태완","박승환","서동욱","서수빈","손병찬","송기서","송재윤","유진영","윤현영","이상진","이현민","임정건"]
end
