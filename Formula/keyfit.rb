class Keyfit < Formula
  include Language::Python::Virtualenv

  desc "Per-project, verified environments for AI coding tools"
  homepage "https://keyfit.dev"
  url "https://files.pythonhosted.org/packages/da/75/eff809efc4ba8618dfcc965b4e2e86c117c839b2ca7420a58f943322a7c8/keyfit-0.1.1.tar.gz"
  sha256 "70ed68ca95c70fa0bfc6466b87378c92a5c238f8b344d9ed5a5195abe533039d"
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
