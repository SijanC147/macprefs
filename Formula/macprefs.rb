class Macprefs < Formula
  include Language::Python::Virtualenv

  desc "Backup and Restore your Mac System and App Preferences"
  homepage "https://github.com/sijanc147/macprefs"
  url "https://github.com/SijanC147/macprefs/releases/download/v2.0.15/macprefs-2.0.15.tar.gz"
  sha256 "a66102e0e29d372d629d2ac8606f28cdd53b5b015364e0ed459d93c48d7d2303"

  depends_on "python"

  resource "mock" do
    url "https://files.pythonhosted.org/packages/66/ab/41d09a46985ead5839d8be987acda54b5bb93f713b3969cc0be4f81c455b/mock-5.1.0.tar.gz"
    sha256 "5e96aad5ccda4718e0a229ed94b2024df75cc2d55575ba5762d31f5767b8767d"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/macprefs", "--help"
  end
end