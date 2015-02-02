module Learn

  #
  # Learn a new task described in a local file
  #
  def file(path)
    self.filepath = filepath
    puts "Learning the skill from file #{@filepath}"

    assert_file_exists
    create_stash
    stash_file

    slate = Module.new
    slate.module_eval(File.read(internal_location))
    skill_name = slate.constants.first.to_s
    skill = Billy::Skill.new(
      name: skill_name,
      internal_location: internal_location
    )
    brain.skill_set.skills << skill
    brain.update_knowledge
    brain.save_knowledge
  end

  #
  # Learn a set of new tasks described in a local directory
  #
  def directory(path)
    Dir.glob("#{path}/*.rb").each do |path|
      file(path)
    end
  end

  private

  attr_accessor :filepath

  def filename
    filepath[/(?<=\/)[^\/]*?$/]
  end

  def internal_location
    "#{brain.skills_path}#{filename}"
  end

  def assert_file_exists
    fail "Naaa, cannot find that file" unless File.exist?(filepath)
  end

  def create_stash
    FileUtils.mkdir_p(brain.skills_path)
  end

  def stash_file
    FileUtils.cp(filepath, internal_location)
  end

end