class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.2.5"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.2.5/valdr-v0.2.5-macos-arm64.tar.gz"
  sha256 "0aa615851d6b40bf71b3fbc49b8372776a640edeb824dfaa8a2f802d3ef1cf62"

  def install
    libexec.install Dir["*"]
    bin.install libexec/"bin/valdr"
  end

  test do
    assert_match "valdr ", shell_output("#{bin}/valdr version")
  end
end
