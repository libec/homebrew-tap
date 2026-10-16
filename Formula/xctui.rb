class Xctui < Formula
  desc "Terminal UI to build, run and test Xcode projects"
  homepage "https://github.com/libec/xctui"
  url "https://github.com/libec/xctui/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "164b9e9ee4597f9f51a1ed8e32e345274213645ced56e44b153b4a28e3cf88f0"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/xctui build")
  end
end
