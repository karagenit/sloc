task :default => [:clean, :build, :test, :install]

task :build do
    sh "bundle install"
    sh "gem build github_sloc.gemspec"
end

task :install do
    sh "gem install github_sloc-" + Sloc::VERSION + ".gem"
end

task :clean do
    system "gem uninstall github_sloc"
    system "rm *.gem"
end

task :test do
    #sh "rubocop bin/"
end

task :publish do
    puts "Current Version: " + Sloc::VERSION
    print "New Version: "
    vers = STDIN.gets.chomp
    #IO.write('version.txt', vers) #TODO update version no.
    sh "rake build"
    system "github_changelog_generator"
    system "git commit -am \"Update Version\""
    system "git tag -a v" + vers + " -m \"\""
    system "git push origin master"
    system "git push origin v" + Sloc::VERSION
    system "gem push github_fastforward-" + Sloc::VERSION + ".gem"
end
