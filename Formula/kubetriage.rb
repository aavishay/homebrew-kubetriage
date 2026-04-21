class Kubetriage < Formula
  desc "KubeTriage - Autonomous SRE Guard for Kubernetes"
  homepage "https://github.com/aavishay/kubetriage"
  license "MIT"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/aavishay/kubetriage/releases/download/v#{version}/kubetriage-darwin-arm64.tar.gz"
      sha256 "cb0fb2e925561ba4355565fb66e441367b3ec298859aecda5515b9164875d8c2"
    end
    on_intel do
      url "https://github.com/aavishay/kubetriage/releases/download/v#{version}/kubetriage-darwin-amd64.tar.gz"
      sha256 "1b041d570498bd185e52e6d33e1e7403809e7ad697f8f591d9be7a59b455d718"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aavishay/kubetriage/releases/download/v#{version}/kubetriage-linux-amd64.tar.gz"
      sha256 "f6696825544f50cea289fc0760e699d41343166351d4b6f07c480a15ec528e8c"
    end
    on_arm do
      url "https://github.com/aavishay/kubetriage/releases/download/v#{version}/kubetriage-linux-arm64.tar.gz"
      sha256 "7464d10e7c65e521f83d148551af33be2f9b3080970b03a1ed799e163426de1c"
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
