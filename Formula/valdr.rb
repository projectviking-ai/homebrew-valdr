class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.1.2/valdr-v0.1.2-macos-arm64.tar.gz"
      sha256 "610315d4ab9f066a90d8166dd35881e3c59b8a640cd79f08aa4ce268497351db"
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
