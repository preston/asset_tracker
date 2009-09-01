mongrel_conf = File.join(RAILS_ROOT, "config", "mongrel_cluster.yml")

namespace :or do
  namespace :mongrel do
    
    desc "Start Mongrel cluster"
    task :start do
      system "mongrel_rails cluster::start -C #{mongrel_conf}"
    end

    desc "Stop Mongrel cluster"
    task :stop do
      system "mongrel_rails cluster::stop -C #{mongrel_conf}"
    end
    
    desc "Restart Mongrel cluster"
    task :restart do
      Rake::Task["or:mongrel:stop"].invoke
      Rake::Task["or:mongrel:start"].invoke
    end
    
  end
end

