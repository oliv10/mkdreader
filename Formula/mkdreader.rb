class Mkdreader < Formula
  desc "Standalone Markdown viewer with micro-like keybindings"
  homepage "https://github.com/oliv10/mkdreader"
  url "https://github.com/oliv10/mkdreader/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "95cca8c182153390093a69cd618438963c859cb8832c448b1ceedd5c9ea7afd2"
  license "MIT"

  bottle do
    root_url "https://github.com/oliv10/mkdreader/releases/download/v0.1.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ba5f61baefe491de20cfa34c188f8a19abc3543c808e115f44e848ca150a4459"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "a1784a735030bdd7acf6f3007ffa250885fc6366f812d0d505fa554216536699"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bab9b5eb76c5c9c9ea0ec1dd9792e9c8ca6502598bd89539b5946ba164454c60"
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
