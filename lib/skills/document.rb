module Document

  #
  # Generate markdown documentation
  #
  def markdown(skill = nil, task = nil)

    skills = skill ? [brain.find_skill(skill)] : brain.skills
    puts "# Default Goat Skills and Tasks"
    skills.each do |skill|
      puts "* [#{skill}](#user-content-skill-#{skill.name.downcase})"
    end
    puts

    skills.each do |skill|

      puts "## Skill: #{skill}"

      if skill.documentation?
        puts skill.documentation(task, :markdown)
      else
        puts documentation(skill, task)
      end

    end

  end

  private

    def documentation(skill, task=nil)
      tasks = task ? [skill.find_task(task)] : skill.tasks
      tasks.map { |task| task_documentation(skill, task) }
    end

    def task_documentation(skill, task)
      Billy::Documentation.new(method: task.method, mode: :markdown).inspect
    end

end

