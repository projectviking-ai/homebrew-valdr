class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.1.3/valdr-v0.1.3-macos-arm64.tar.gz"
      sha256 "b26c8334ead64befcf4098405d162988c638496b28cee29b7760c3f955f3a367"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install libexec/"bin/valdr"
    bin.install libexec/"bin/node" if (libexec/"bin/node").exist?
  end

  test do
    assert_match "valdr ", shell_output("#{bin}/valdr version")
  end
end
