class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.3.6"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.6/valdr-v0.3.6-macos-arm64.tar.gz"
    sha256 "ad719c40d20a9eae945810ce0bcdef0e56570040ae1939bdb540e7f6f2685177"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.6/valdr-v0.3.6-linux-arm64.tar.gz"
      sha256 "1dbfd1724b341b7cea321defc1d094f174ef6e1d3a5612455c5a6fca63acce84"
    elsif Hardware::CPU.intel?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.6/valdr-v0.3.6-linux-x64.tar.gz"
      sha256 "906d4a3055fc484aab773edb238a64756a430eba65c1c0ecbcd14d990911be29"
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
