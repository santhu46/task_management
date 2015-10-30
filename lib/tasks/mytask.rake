desc "CreateMigration"
  namespace :db do
    task create_task_table: :environment do
      File.open("#{Rails.root}/db/migrate/#{Time.now.to_i}_create_tasks.rb", "w") do |f|

        sql= <<-SQL
          class CreateTasks < ActiveRecord::Migration
            def change
              create_table :tasks do |t|
                t.string :name

                t.timestamps null: false
              end
            end
          end
        SQL

        f.write( sql )
      end
  end
 end

