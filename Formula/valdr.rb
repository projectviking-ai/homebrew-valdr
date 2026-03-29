class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.1.1/valdr-v0.1.1-macos-arm64.tar.gz"
      sha256 "a1021c82a388b3119b33d7d7d8a08d54902ed0dc4cc63cb47732c9e092df3664"
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
