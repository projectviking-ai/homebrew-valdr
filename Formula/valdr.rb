class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.3.9"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.9/valdr-v0.3.9-macos-arm64.tar.gz"
    sha256 "fc7f627d3f4217e94362b251f6a64a5409c0c22051410428eb0987cd163de15d"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.9/valdr-v0.3.9-linux-arm64.tar.gz"
      sha256 "cf7a7f7ac3397d512cbba54a72789bfcb6b6a55ea287b4142eb8efd16e2af438"
    elsif Hardware::CPU.intel?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.9/valdr-v0.3.9-linux-x64.tar.gz"
      sha256 "830b3fc592a45c56cd423e7695df815aa0f811b791f09191fe0d12e0517ae87d"
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
