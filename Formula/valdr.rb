class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.4.2"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.4.2/valdr-v0.4.2-macos-arm64.tar.gz"
    sha256 "62ea22ef8e0fd90f6f70e144c53cbc022a30fa8aef21e6873c1dc2fffc50e0b3"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.4.2/valdr-v0.4.2-linux-arm64.tar.gz"
      sha256 "b51f33f95e506051e72a1467adcc6372ec4a96ca3258badf6a747a301538af77"
    elsif Hardware::CPU.intel?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.4.2/valdr-v0.4.2-linux-x64.tar.gz"
      sha256 "0a06822231dfef8ef162a7fad89b9699e685f588a911ba3ea5b1f26272ecc6ae"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install libexec/"bin/valdr"
  end

  test do
    assert_match "valdr ", shell_output("#{bin}/valdr version")
  end
end
