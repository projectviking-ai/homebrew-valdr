class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.2.2"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.2.2/valdr-v0.2.2-macos-arm64.tar.gz"
  sha256 "a776d8d0af9552e114c9f19526dbb379501a2a20e63369d64ce780985957f11a"

  def install
    libexec.install Dir["*"]
    bin.install libexec/"bin/valdr"
  end

  test do
    assert_match "valdr ", shell_output("#{bin}/valdr version")
  end
end
