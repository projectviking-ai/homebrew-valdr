class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.3.2"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.2/valdr-v0.3.2-macos-arm64.tar.gz"
    sha256 "36351de03ee7848c9892e40661c2ce04cbfe61bda0235a48ddbe2ef20fea50f2"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.2/valdr-v0.3.2-linux-arm64.tar.gz"
      sha256 "c0317a5089090e44d7ef95a6a54a8ea674edee237ece9a594785f6c05bcf4687"
    elsif Hardware::CPU.intel?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.2/valdr-v0.3.2-linux-x64.tar.gz"
      sha256 "30729f248ff01632e05619710a751529f1a3ac1bce71fddc6a7870a3baba5c1d"
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
