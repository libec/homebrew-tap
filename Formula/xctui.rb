class Xctui < Formula
  desc "Terminal UI to build, run and test Xcode projects"
  homepage "https://github.com/libec/xctui"
  url "https://github.com/libec/xctui/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "817b711d2f03dcfecd8ac50e8cd4b7edc2dc54d933c698744053298139fbddc4"
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
