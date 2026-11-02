class LumiCodexStatusline < Formula
  desc "Codex CLI status panel: context in absolute tokens, limits with countdowns"
  homepage "https://github.com/illumichente/lumi-codex-statusline"
  url "https://github.com/illumichente/lumi-codex-statusline/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0c98061148b7460f57600cd1175c8a10b004cec89b6e6b2dee011728627845f3"
  license "MIT"

  uses_from_macos "jq", since: :sequoia

  def install
    bin.install "codex-statusline.sh" => "codex-statusline"
  end

  def caveats
    <<~EOS
      Run in a split pane next to Codex:  codex-statusline --watch
    EOS
  end

  test do
    ENV["CODEX_HOME"] = testpath.to_s
    assert_match "no session log", shell_output("#{bin}/codex-statusline")
  end
end
