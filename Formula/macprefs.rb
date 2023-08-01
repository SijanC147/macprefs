class Macprefs < Formula
  include Language::Python::Virtualenv

  desc "Backup and Restore your Mac System and App Preferences"
  homepage "https://github.com/sijanc147/macprefs"
  url "https://github.com/SijanC147/macprefs/releases/download/v2.0.26/macprefs-2.0.26.tar.gz"
  sha256 "23cd15a6ee4490a433575f51f02e097faa3c69fa17e511d9a21faa387a134bdb"

  depends_on "python"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/macprefs", "--help"
  end
end