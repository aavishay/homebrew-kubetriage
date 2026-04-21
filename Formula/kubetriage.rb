class Kubetriage < Formula
  desc "KubeTriage - Autonomous SRE Guard for Kubernetes"
  homepage "https://github.com/aavishay/kubetriage"
  license "MIT"
  version "0.0.3"

  on_macos do
    on_arm do
      url "https://github.com/aavishay/kubetriage/releases/download/v#{version}/kubetriage-darwin-arm64.tar.gz"
      sha256 "0318012278aa922f81258482774ff44be39acf4674b51b2f0866855388e0b8eb"
    end
    on_intel do
      url "https://github.com/aavishay/kubetriage/releases/download/v#{version}/kubetriage-darwin-amd64.tar.gz"
      sha256 "a44f4837e0ef3ce8860652142e40b38d7ca7413338143b117819957c934e954a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aavishay/kubetriage/releases/download/v#{version}/kubetriage-linux-amd64.tar.gz"
      sha256 "5ca4582781663d6b192f2ded019dd7e5f4c277ef47f00f163267ab0e4763940f"
    end
    on_arm do
      url "https://github.com/aavishay/kubetriage/releases/download/v#{version}/kubetriage-linux-arm64.tar.gz"
      sha256 "3f88e44396f562dc399446b37201a4efec99633de41bc114794e81c43de7afac"
    end
  end

  def install
    bin.install "kubetriage-#{OS.kernel_name.downcase}-#{Hardware::CPU.arch.to_s.gsub(/x86_64/, "amd64")}" => "kubetriage"
  end

  def post_install
    puts "KubeTriage installed!"
    puts "Run 'kubetriage serve' to start the server."
    puts "Run 'kubetriage --help' for all available commands."
  end

  test do
    system "#{bin}/kubetriage", "--help"
  end
end
