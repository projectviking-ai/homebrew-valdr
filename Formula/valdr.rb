class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.1.8"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.1.8/valdr-v0.1.8-macos-arm64.tar.gz"
  sha256 "b06e800d89b6ef7bb8bbd74303f51575e1dc1fde8466f60a9084a9b5d1688972"

  def install
    libexec.install Dir["*"]
    bin.install libexec/"bin/valdr"
  end

  test do
    assert_match "valdr ", shell_output("#{bin}/valdr version")
  end
end
