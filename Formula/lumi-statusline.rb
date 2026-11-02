class LumiStatusline < Formula
  desc "Claude Code status line with absolute context and subscription limits"
  homepage "https://github.com/illumichente/lumi-statusline"
  url "https://github.com/illumichente/lumi-statusline/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "d50f876954edba0db3b7ab9b0057b9a7432bb575fecc59017b76a311a2581edb"
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
