lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "github_sloc/version"

task :default => [:clean, :build, :test, :install]

task :build do
    sh "bundle install"
    sh "gem build github_sloc.gemspec"
end

task :install do
    sh "gem install github_sloc-" + GithubSloc::VERSION + ".gem"
end

task :clean do
    system "gem uninstall github_sloc"
    system "rm *.gem"
end

task :test do
    #sh "rubocop bin/"
end

task :publish do
    puts "Current Version: " + GithubSloc::VERSION
    print "New Version: "
    vers = STDIN.gets.chomp
    IO.write(File.expand_path('../lib/github_sloc/version.rb', __FILE__), "module GithubSloc\n  VERSION ||= \"#{vers}\"\nend\n")
    load "github_sloc/version.rb"
    sh "rake build"
    system "github_changelog_generator"
    system "git commit -am \"Update Version\""
    system "git tag -a v" + vers + " -m \"\""
    system "git push origin master"
    system "git push origin v" + GithubSloc::VERSION
    system "gem push github_sloc-" + GithubSloc::VERSION + ".gem"
end
