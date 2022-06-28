namespace :scheduled_tasks do
  Dir[File.join(Rails.root, "app/jobs/scheduled_tasks/*.rb")].each{ |f| require f }

  classes = ObjectSpace.each_object(Class).select {|klass| klass.name.to_s.include?('ScheduledTasks::') }

  classes.each do |klass|
    class_name = klass.to_s
    task_name = class_name.gsub('ScheduledTasks::', '').gsub('::', ':').underscore.gsub('_job', '')

    desc "Runs #{class_name}"
    task task_name => :environment do
      puts "Executing job #{klass.to_s}"
      klass.new.perform
    end
  end
end
