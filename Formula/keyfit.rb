class Keyfit < Formula
  include Language::Python::Virtualenv

  desc "Per-project, verified environments for AI coding tools"
  homepage "https://keyfit.dev"
  url "https://files.pythonhosted.org/packages/12/74/9a6268980a875271bc0ab42fd1570251440ad947ad2c154d406130b0c53e/keyfit-0.1.0.tar.gz"
  sha256 "4a327017356e27f8bac5fb5009f8ac18b9972cf3c6ed7b1c17b43775d6b9de67"
  license "MIT"

  depends_on :macos # keys live in the macOS Keychain; `keyfit setup` refuses elsewhere for now
  depends_on "python@3.13"

  # No resources: Keyfit uses the standard library only.

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Put Keyfit in front of claude, codex, opencode, copilot, gemini, aws, gh, vercel, supabase, wrangler, convex, gcloud and firebase (new terminals pick it up):
        keyfit setup --rc
      The shims run #{opt_libexec}/bin/python, so they survive `brew upgrade`.
      Run `keyfit setup` again if this formula ever moves to another Python version.
      Before `brew uninstall keyfit`, run: keyfit setup --remove
    EOS
  end

  test do
    assert_match "keyfit #{version}", shell_output("#{bin}/keyfit --version")
  end
end
