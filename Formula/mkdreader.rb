class Mkdreader < Formula
  desc "Standalone Markdown viewer with micro-like keybindings"
  homepage "https://github.com/oliv10/mkdreader"
  url "https://github.com/oliv10/mkdreader/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "e398885d01c29f44695062f0c72bcba69fb6c5717b06ba5852f35615964002e3"
  license "MIT"

  bottle do
    root_url "https://github.com/oliv10/mkdreader/releases/download/v0.1.7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "756f2e0158879e3eb4265a06929b5152027cb8dcfba7e4805575e2da65efb4cf"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "c1fd5ee2a9cd9f8554c92fb6f6462d1c237da71f9e9ffaf06cb23ef290893197"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c220c737e35695ed06e09a3dd3ebd297b11ab267b0f9d6f45d3963acbfaecaff"
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
