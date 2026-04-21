class Kubetriage < Formula
  desc "KubeTriage - Autonomous SRE Guard for Kubernetes"
  homepage "https://github.com/aavishay/kubetriage"
  license "MIT"
  version "0.0.4"

  on_macos do
    on_arm do
      url "https://github.com/aavishay/kubetriage/releases/download/v#{version}/kubetriage-darwin-arm64.tar.gz"
      sha256 "a68a55f03f686914ffaf807b3fae3c2fa0339a247884f3216c3aa59b1c312f3f"
    end
    on_intel do
      url "https://github.com/aavishay/kubetriage/releases/download/v#{version}/kubetriage-darwin-amd64.tar.gz"
      sha256 "58ed35c368046a04d40547703bbd6c7ae79062647596deefb95a33ddf74070a1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aavishay/kubetriage/releases/download/v#{version}/kubetriage-linux-amd64.tar.gz"
      sha256 "7388fa447d75a4b2cdc37cae6471b50f0bb60a49296081eb543fac3136a7c1bd"
    end
    on_arm do
      url "https://github.com/aavishay/kubetriage/releases/download/v#{version}/kubetriage-linux-arm64.tar.gz"
      sha256 "4d71cb5699047d7b9de402524b90389ca4b210001662decd9bf00feabf43bc34"
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
    system "#{bin}/kubetriage", "--help'"
    end
end
