namespace :or do
  namespace :db do
    namespace :sessions do
      desc "Clear RAILS_ENV database sessions older than two weeks"
      task :clear => :environment do
        CGI::Session::ActiveRecordStore::Session.delete_all ["updated_at < ?", 2.weeks.ago ] 
      end

      desc "Count RAILS_ENV database sessions"
      task :count => :environment do
        puts "Currently storing #{CGI::Session::ActiveRecordStore::Session.count} sessions"
      end      
    end
  end
end