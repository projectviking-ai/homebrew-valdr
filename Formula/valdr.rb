class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.3.1"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.1/valdr-v0.3.1-macos-arm64.tar.gz"
    sha256 "f6f08d9734b1f5e3d4ab3b598a8386d217297a771ac666f05ee43c5fe0adb4ef"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.1/valdr-v0.3.1-linux-arm64.tar.gz"
      sha256 "c4b35f003743b06a708976da4a34badf337fefbd6da8f997ead5d12edbacb994"
    elsif Hardware::CPU.intel?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.1/valdr-v0.3.1-linux-x64.tar.gz"
      sha256 "c2e688d3e73f1ff60acda147fa30681487179c1c57226a4de417149144585498"
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
