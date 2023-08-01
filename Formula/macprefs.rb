class Macprefs < Formula
  include Language::Python::Virtualenv

  desc "Backup and Restore your Mac System and App Preferences"
  homepage "https://github.com/sijanc147/macprefs"
  url "https://api.github.com/repos/SijanC147/macprefs/releases/download/v2.0.14/macprefs-2.0.14.tar.gz"
  sha256 "af8737725537718fa7b3726a891fc51041f5bf3610060049553b5bc53a441446"

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