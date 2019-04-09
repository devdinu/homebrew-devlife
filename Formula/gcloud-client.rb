require 'tmpdir'

class GcloudClient < Formula
  desc "gcloud-client tool which does more for devs than gcloud"
  url "https://github.com/devdinu/gcloud-client.git", :using => :git, :tag => "v0.1.1"
  version "0.1.1"

  depends_on "tmux"
  depends_on "go" => :build

  def install
    dest = File.join(ENV["HOMEBREW_CELLAR"], "gcloud-client")
    Dir["./scripts/templates/*.yml"].each do |f|
      FileUtils.cp(f, dest)
    end
    puts "copied templates to #{dest}"

    system "sh", "scripts/install.sh", Dir.tmpdir
    # tmuxinator couldn't be installed with dir permissions issue
    bin.install "#{Dir.tmpdir}/gcloud-client" => "gcl"
  end

  test do
    system "command", "-v", "gcl"
  end
end
