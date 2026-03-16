class Mkdreader < Formula
  desc "Standalone Markdown viewer with micro-like keybindings"
  homepage "https://github.com/oliv10/mkdreader"
  url "https://github.com/oliv10/mkdreader/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "6d43f097515ec7f25c9d030314243b31212fae230cfc5c6539770004a70769c2"
  license "MIT"

  bottle do
    root_url "https://github.com/oliv10/mkdreader/releases/download/v0.1.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "31aded422f5e6967d1e20048d95eb99c083a7034a79c7c739533b3f3bb4bcf79"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "37a970229794916b109d470517a53613f6a9bae3134488d9e8f6b30b99feca10"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e4d75d00adf8938c0b3bdf2f637abc56cb10f317d7a0c728324ad6240902f8ca"
  end

  depends_on "python@3.14"
  uses_from_macos "less"
  on_linux do
    depends_on "less"
  end

  def install
    # Use a portable Python shebang for runtime across Homebrew environments.
    inreplace "mkdreader", %r{^#!.*python[0-9.]*$}, "#!/usr/bin/env python3"
    bin.install "mkdreader"
  end

  test do
    (testpath/"sample.md").write("# Hello\n\nworld\n")
    output = shell_output("#{bin}/mkdreader sample.md --no-pager")
    assert_match("HELLO", output)
  end
end
