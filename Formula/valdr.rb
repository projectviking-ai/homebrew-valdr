class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.1.1"

  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.1.1/valdr-v0.1.1-macos-arm64.tar.gz"
      sha256 "da2a3332bdfc9f02382ba121945497393e6feec0d873a6e71e19108113f633de"
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
