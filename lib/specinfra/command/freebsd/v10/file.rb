class Specinfra::Command::Freebsd::V10::File < Specinfra::Command::Freebsd::Base::File
  class << self

    def get_mode(file)
      "stat -f%m%Lp #{escape(file)}"
    end

  end
end


