class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.1.5"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.1.5/valdr-v0.1.5-macos-arm64.tar.gz"
  sha256 "8fd06ff7cc0f022dd58232995e65fef260e93dd85ae9b11c26d84e56a63c336f"

  def install
    libexec.install Dir["*"]
    bin.install libexec/"bin/valdr"
  end

  test do
    assert_match "valdr ", shell_output("#{bin}/valdr version")
  end
end
