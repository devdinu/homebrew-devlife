class GcloudClient < Formula
  desc "gcloud-client tool which does more for devs than gcloud"
  url "github.com/devdinu/gcloud-client"
  sha256 "20f0085f6fb83d3c49f2a6ef325a7e27bb277c55e26692a87b6e02b79f37bb2a"


  depends_on "tmux"
  depends_on "go" => :build

  def install
    system "scripts/install.sh"
    bin.install "gcloud-client"
  end

  test do
    system "command" "-v" "gcloud-client"
  end
end
