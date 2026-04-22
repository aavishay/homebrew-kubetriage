class Kubetriage < Formula
  desc "Autonomous SRE Guard for Kubernetes"
  homepage "https://github.com/aavishay/kubetriage"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aavishay/kubetriage/releases/download/v#{version}/kubetriage-v#{version}-darwin-arm64.tar.gz"
      sha256 "0f4e1c98f34ccf7e488210c2212c0f34208a05e227f1bf9b057fd67b54eb2ffb"
    end
    on_intel do
      url "https://github.com/aavishay/kubetriage/releases/download/v#{version}/kubetriage-v#{version}-darwin-amd64.tar.gz"
      sha256 "9e20fe3135126067970e4a2826fcce8667208a1032f0d6b5fc21487f2a4027a3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aavishay/kubetriage/releases/download/v#{version}/kubetriage-v#{version}-linux-amd64.tar.gz"
      sha256 "6eae5d319b3b038a54b1211dee0719a03962cc86fb09018cdcc052e37bad04b9"
    end
    on_arm do
      url "https://github.com/aavishay/kubetriage/releases/download/v#{version}/kubetriage-v#{version}-linux-arm64.tar.gz"
      sha256 "6fe753764b386d1d4aa796df03e4e8b41f0beded69c8cbb01dd83109ca520697"
    end
  end

  def install
    binary_name = "kubetriage-#{OS.kernel_name.downcase}-#{Hardware::CPU.arch}"
    binary_name = binary_name.gsub("x86_64", "amd64")
    bin.install binary_name => "kubetriage"
  end

  def post_install
    puts "KubeTriage installed!"
    puts "Run 'kubetriage serve' to start the server."
    puts "Run 'kubetriage --help' for all available commands."
  end

  test do
    system bin/"kubetriage", "--help"
  end
end
