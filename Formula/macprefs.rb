class Macprefs < Formula
  include Language::Python::Virtualenv

  desc "Backup and Restore your Mac System and App Preferences"
  homepage "https://github.com/sijanc147/macprefs"
  url "https://github.com/SijanC147/macprefs/releases/download/v2.0.20/macprefs-2.0.20.tar.gz"
  sha256 "9f65ea6dfd1ed25b4a9c875670f4c1ae585972108531a3027b319ed55c64757f"

  depends_on "python"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/macprefs", "--help"
  end
end