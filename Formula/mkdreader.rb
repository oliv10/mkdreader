class Mkdreader < Formula
  desc "Standalone Markdown viewer with micro-like keybindings"
  homepage "https://github.com/oliv10/mkdreader"
  url "https://github.com/oliv10/mkdreader/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "3b15388c70b228cb3627e263c3c9f4c6f555ee44208baf7c5c92b5fb75746b92"
  license "MIT"

  bottle do
    root_url "https://github.com/oliv10/mkdreader/releases/download/v0.1.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7475091e8b90d93e16be0da29ab39954cb0a93fce4124072e70e1a3f8b951c43"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "010779d93d76d908aedc9985157925edc2c433b02b99ba3a78f3ce499e1a4931"
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
