class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.1.4"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.1.4/valdr-v0.1.4-macos-arm64.tar.gz"
  sha256 "4389f6ef9ad5aef805b096d9b464801aec84320a6b8ee69158d9b7a80b795343"

  def install
    libexec.install Dir["*"]
    bin.install libexec/"bin/valdr"
    bin.install libexec/"bin/node" if (libexec/"bin/node").exist?
  end

  test do
    assert_match "valdr ", shell_output("#{bin}/valdr version")
  end
end
