module Git

  def self.extended(mod)
    Dependencies.gem_require('git')
    require 'logger'
  end

  #
  # Delegate command
  #
  #
  def delegate(arg)
    case
    when repository.respond_to?(arg)
      puts repository.send(arg)
    when repository.lib.respond_to?(arg)
      puts repository.lib.send(arg)
    end
  end

  #
  # Documentation
  #
  def documentation(skill, task=nil, mode=nil)

    base_skill = Billy::Skill.new(name: 'Git::Base')
    lib_skill = Billy::Skill.new(name: 'Git::Lib')
    all_tasks = base_skill.tasks + base_skill.tasks
    tasks = task ? [base_skill.find_task(task) || lib_skill.find_task(task)] : all_tasks
    tasks.map do |task|
      Billy::Documentation.new(
        method: task.method,
        owner: skill.name.downcase,
        mode: mode
      ).inspect
    end

  end

  private

    def repository(path = '.')
      Git.open(path, :log => Logger.new(StringIO.new))
    end

end