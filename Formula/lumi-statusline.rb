class LumiStatusline < Formula
  desc "Claude Code status line with absolute context and subscription limits"
  homepage "https://github.com/illumichente/lumi-statusline"
  url "https://github.com/illumichente/lumi-statusline/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "772007cd9fbbb1de6ee81eee0cbf31063dfd70441a7fe45f6e7dd018c0abb0f4"
  license "MIT"

  uses_from_macos "jq", since: :sequoia

  def install
    libexec.install "statusline.sh", "install.sh"
    (bin/"lumi-statusline").write_env_script libexec/"install.sh", {}
  end

  def caveats
    <<~EOS
      Run `lumi-statusline` to enable the status line in ~/.claude/settings.json.
      Run `lumi-statusline --uninstall` to disable it again.
    EOS
  end

  test do
    assert_match "Claude", pipe_output("bash #{libexec}/statusline.sh", "{}")
  end
end
