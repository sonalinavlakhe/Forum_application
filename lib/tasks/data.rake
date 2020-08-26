
desc "Load external JSON data to DB"

task :load_users_data => [ :environment ] do
  begin
    input_data = File.read(ARGV[1])
  rescue StandardError => error
    puts "Error reading user file #{error}"
    return
  end

  users_data = JSON.parse(input_data)

  if users_data.present?
    users_data["data"].each do |input|
      begin
        user = User.new
        user.id = input["id"].to_i
        user.name = input["name"]
        user.email = (0...10).map { ('a'..'z').to_a[rand(26)] }.join + "@gmail.com"
        user.password = 123456 
        user.save!
      rescue StandardError => error
        puts "-------------------------------------------"
        puts "Error while Loading user data#{error.message}"
      end
    end
  end
  puts "Task successfully completed" unless error.present?
end

task :load_topics_data => [ :environment ] do
  begin
    input_data = File.read(ARGV[1])
  rescue StandardError => bang
    puts "Error reading topics file #{ bang }"
    return
  end

  topics_data = JSON.parse(input_data)

  if topics_data.present?
    topics_data["data"].each do |input|
      begin
        topic = Topic.new
        topic.id = input["id"].to_i
        topic.subject = input["subject"]
        topic.content = input["content"]
        topic.user_id = input["creator"]["id"].to_i
        status = input["status"]
        topic.save!
      rescue StandardError => error
        puts "-------------------------------------------"
        puts "Error while Loading topic data#{error.message}"
      end
    end
  end
  puts "Task successfully completed" unless error.present?
end


task :load_comments_data => [ :environment ] do
  begin
    input_data = File.read(ARGV[1])
  rescue StandardError => bang
    puts "Error reading comment file #{ bang }"
    return
  end

  data = JSON.parse(input_data)
  return unless data.present?

  comments_data = data["comments"]

  if comments_data.present?
    comments_data.each do |input|
      begin
        comment = Comment.new
        comment.topic_id = data["id"].to_i
        comment.user_id = data["creator"]["id"].to_i
        comment.id = input["id"]
        comment.comment = input["content"]
        comment.save!
      rescue StandardError => error
        puts "-------------------------------------------"
        puts "Error while Loading comment data#{error.message}"
      end
    end
  end
end
