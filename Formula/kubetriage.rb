class Kubetriage < Formula
  desc "KubeTriage - Autonomous SRE Guard for Kubernetes"
  homepage "https://github.com/aavishay/kubetriage"
  license "MIT"
  version "0.0.3"

  on_macos do
    on_arm do
      url "https://github.com/aavishay/kubetriage/releases/download/v#{version}/kubetriage-darwin-arm64.tar.gz"
      sha256 "a2803b8f595e051757c917bcad7ece231e3b4666a6f0b5a243d8170d9884e587"
    end
    on_intel do
      url "https://github.com/aavishay/kubetriage/releases/download/v#{version}/kubetriage-darwin-amd64.tar.gz"
      sha256 "343104c7d84582f3050649af5c5364fb470eb3f03e07a736758f9066e773d7d2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aavishay/kubetriage/releases/download/v#{version}/kubetriage-linux-amd64.tar.gz"
      sha256 "6d816fbe3574d7bc009e5d6602b56b3f50d96434c1b15a60db65d59c24e76f07"
    end
    on_arm do
      url "https://github.com/aavishay/kubetriage/releases/download/v#{version}/kubetriage-linux-arm64.tar.gz"
      sha256 "e593127337a08a83606d8ef9caf15cc89d02842903b49bb3cf52c3775e979e4d"
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
