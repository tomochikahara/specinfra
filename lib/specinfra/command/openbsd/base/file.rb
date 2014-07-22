class Specinfra::Command::Openbsd::Base::File < Specinfra::Command::Base::File
  def check_has_md5checksum(file, expected)
    regexp = "^#{expected}"
    "cksum -qa md5 #{escape(file)} | grep -w #{escape(regexp)}"
  end

  def check_has_sha256checksum(file, expected)
    regexp = "^#{expected}"
    "cksum -qa sha256 #{escape(file)} | grep -w #{escape(regexp)}"
  end

  def check_is_linked_to(link, target)
    "stat -f %Y #{escape(link)} | grep -- #{escape(target)}"
  end

  def check_mode(file, mode)
    regexp = "^#{mode}$"
    "stat -f%Lp #{escape(file)} | grep #{escape(regexp)}"
  end

  def check_is_owned_by(file, owner)
    regexp = "^#{owner}$"
    "stat -f %Su #{escape(file)} | grep -- #{escape(regexp)}"
  end

  def check_is_grouped(file, group)
    regexp = "^#{group}$"
    "stat -f %Sg #{escape(file)} | grep -- #{escape(regexp)}"
  end

  def check_is_mounted(path)
    regexp = "on #{path} "
    "mount | grep #{escape(regexp)}"
  end

  def get_mode(file)
    "stat -f%Lp #{escape(file)}"
  end
end