module Help

  #
  # Show all documentation
  # Show the documentation for a skill
  # Show the documentation for a skill and task
  #
  def explain(skill = nil, task = nil)

    skills = skill ? [brain.find_skill(skill)] : brain.skills
    skills.each do |skill|

      puts "#"*80
      puts "## Skill: #{skill}"
      puts "##"
      puts

      if skill.documentation?
        puts skill.documentation(task)
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
      Billy::Documentation.new(method: task.method).inspect
    end

end

