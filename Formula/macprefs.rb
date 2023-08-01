class Macprefs < Formula
  include Language::Python::Virtualenv

  desc "Backup and Restore your Mac System and App Preferences"
  homepage "https://github.com/sijanc147/macprefs"
  url "https://github.com/SijanC147/macprefs/releases/download/v2.0.18/macprefs-2.0.18.tar.gz"
  sha256 "63c3bf4dd6a72e431555e2930567e42176c27fc45b6c0e7551220604b4add74a"

  depends_on "python"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/macprefs", "--help"
  end
end