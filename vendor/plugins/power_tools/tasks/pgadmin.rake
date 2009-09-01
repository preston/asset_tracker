require File.dirname(__FILE__)+'/common'

LOG_PATH="backups"

## 
## Backup and restore scripts for PostgreSQL backed Rails apps
##
## HOW TO USE:
##
## Backup production database
##   >> RAILS_ENV=production rake or:pgsql:backup
## Restore production database
##   >> RAILS_ENV=production rake or:pgsql:restore backup=app_2008-01-04_17-13-04_production.sql.bz2

namespace :or do
  namespace :pgsql do

    desc "Backup the database to a file (defaults to development)"
    task :backup => :environment do
      env = RAILS_ENV
      datestamp = Time.now.strftime("%Y-%m-%d_%H-%M-%S")
      file = "app_#{datestamp}_#{env}.sql.bz2"
      h, d, u, p = load_database_yml(env)
      `mkdir -p #{LOG_PATH}`
      
      puts "Backing #{env.upcase} to #{LOG_PATH}/#{file}"
      cmd = "PGPASSWORD=#{p} pg_dump --clean --no-owner --no-privileges -U#{u} -h#{h} #{d} | bzip2 > #{LOG_PATH}/#{file}"
      `#{cmd}`
    end
    
    desc "Restore the RAILS_ENV database from a backup file. e.g. backup=app_2008-01-04_17-13-04_production.sql.bz2"
    task :restore => :environment do
      unless ENV.include?("backup")
        puts `ls -lc #{LOG_PATH}/*.sql.bz2`
        raise "Usage: RAILS_ENV=production rake or:db:restore backup=app_2008-01-04_17-13-04_production.sql.bz2"    
      end
      file = "#{LOG_PATH}/#{ENV['backup']}"
      puts file
      raise "Backup file does not found" unless File.exists?(file)
      
      env = RAILS_ENV
      h, d, u, p = load_database_yml(env)
      
      puts "Restoring #{env.upcase} with #{file}"
      
      Rake::Task["or:pgsql:drop_db"].invoke
      Rake::Task["or:pgsql:create_db"].invoke

      cmd = "bzcat #{file} | psql -U#{u} #{d} -h#{h}"
      puts "\nUnzipping: #{cmd}"
      `#{cmd}`
    end
    
    task :drop_db => :environment do
      env = RAILS_ENV
      h, d, u, p = load_database_yml(env)
      cmd = "dropdb -U#{u} #{d} -h#{h}"
      puts "\nDropping database: #{cmd}"
      `#{cmd}`
    end
   
    task :create_db => :environment do
      env = RAILS_ENV
      h, d, u, p = load_database_yml(env)
      cmd = "createdb -Upostgres -O#{u} -Tpostgres #{d} -h#{h}"
      puts "\nCreating database: #{cmd}"
      `#{cmd}`
    end
    
    namespace :schema do
      desc "Report the current version of the RAILS_ENV database schema."
      task :version => :environment do
        r = ActiveRecord::Base.connection.execute "SELECT version FROM schema_info LIMIT 1"
        puts "SCHEMA VERSION: #{r.result[0][0]}"
      end
    end

  end
end

