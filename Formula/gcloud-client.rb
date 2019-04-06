class GcloudClient < Formula
  desc "gcloud-client tool which does more for devs than gcloud"
  url "https://github.com/devdinu/gcloud-client/releases/tag/v0.1.0"

  depends_on "tmux"
  depends_on "go" => :build

  def install
    system "sh", "scripts/install.sh"
  end

  test do
    system "command", "-v", "gcloud-client"
  end
end
