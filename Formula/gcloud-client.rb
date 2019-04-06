require 'tmpdir'

class GcloudClient < Formula
  desc "gcloud-client tool which does more for devs than gcloud"
  url "https://github.com/devdinu/gcloud-client.git", :using => :git, :tag => "v0.1.0"
  version "0.1.0"

  depends_on "tmux"
  depends_on "go" => :build

  def install
    system "sh", "scripts/install.sh", Dir.tmpdir
    # tmuxinator couldn't be installed with dir permissions issue
    bin.install "#{Dir.tmpdir}/gcloud-client"
  end

  test do
    system "command", "-v", "gcloud-client"
  end
end
