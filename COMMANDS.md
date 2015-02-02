# Default Goat Skills and Tasks
* [Learn](#user-content-skill-learn)
* [Show](#user-content-skill-show)
* [Update](#user-content-skill-update)
* [Help](#user-content-skill-help)
* [Git](#user-content-skill-git)
* [Document](#user-content-skill-document)

## Skill: Learn
### goat learn file \[path\] 
    #
    # Learn a new task described in a local file
    #

### goat learn directory \[path\] 
    #
    # Learn a set of new tasks described in a local directory
    #

## Skill: Show
### goat show settings 
    #
    # Show all goat settings
    #

### goat show setting \[name\] 
    #
    # Show a given goat setting
    #

### goat show credentials (service) 
    #
    # Show the credentials for a particular service
    #

## Skill: Update
### goat update setting \[name\] \[value\] 
    #
    # Update a given goat setting
    #

### goat update credentials \[service\] (*args) 
    #
    # Update the credentials for a particular service
    #

## Skill: Help
### goat help explain (skill) (task) 
    #
    # Show all documentation
    # Show the documentation for a skill
    # Show the documentation for a skill and task
    #

## Skill: Git
### goat git chdir 
    # changes current working directory for a block
    # to the git working directory
    #
    # example
    #  @git.chdir do 
    #    # write files
    #    @git.add
    #    @git.commit('message')
    #  end

### goat git config (name) (value) 
    #g.config('user.name', 'Scott Chacon') # sets value
    #g.config('user.email', 'email@email.com')  # sets value
    #g.config('user.name')  # returns 'Scott Chacon'
    #g.config # returns whole config hash

### goat git dir 
    # returns a reference to the working directory
    #  @git.dir.path
    #  @git.dir.writeable?

### goat git index 
    # returns reference to the git index file

### goat git repo 
    # returns reference to the git repository directory
    #  @git.dir.path

### goat git repo_size 
    # returns the repository size in bytes

### goat git set_index \[index_file\] (check) 

### goat git set_working \[work_dir\] (check) 

### goat git is_local_branch? \[branch\] 
    # returns +true+ if the branch exists locally

### goat git is_remote_branch? \[branch\] 
    # returns +true+ if the branch exists remotely

### goat git is_branch? \[branch\] 
    # returns +true+ if the branch exists

### goat git lib 
    # this is a convenience method for accessing the class that wraps all the 
    # actual 'git' forked system calls.  At some point I hope to replace the Git::Lib
    # class with one that uses native methods or libgit C bindings

### goat git grep \[string\] (path_limiter) (opts) 
    # will run a grep for 'string' on the HEAD of the git repository
    # 
    # to be more surgical in your grep, you can call grep() off a specific
    # git object.  for example:
    #
    #  @git.object("v2.3").grep('TODO')
    #
    # in any case, it returns a hash of arrays of the type:
    #  hsh\[tree-ish\] = \[\[line_no, match\], \[line_no, match2\]\]
    #  hsh\[tree-ish\] = \[\[line_no, match\], \[line_no, match2\]\]
    #
    # so you might use it like this:
    #
    #   @git.grep("TODO").each do |sha, arr|
    #     puts "in blob #{sha}:"
    #     arr.each do |match|
    #       puts "\t line #{match\[0\]}: '#{match\[1\]}'"
    #     end
    #   end

### goat git add (*args) 
    # updates the repository index using the working directory content
    #
    #    @git.add('path/to/file')
    #    @git.add(\['path/to/file1','path/to/file2'\])
    #    @git.add(:all => true)
    #
    # options:
    #   :all => true
    #
    # @param \[String,Array\] paths files paths to be added (optional, default='.')
    # @param \[Hash\] options

### goat git remove (path) (opts) 
    # removes file(s) from the git repository

### goat git reset (commitish) (opts) 
    # resets the working directory to the provided commitish

### goat git reset_hard (commitish) (opts) 
    # resets the working directory to the commitish with '--hard'

### goat git clean (opts) 
    # cleans the working directory
    #
    # options:
    #  :force
    #  :d
    #

### goat git describe (committish) (opts) 
    #  returns the most recent tag that is reachable from a commit
    #
    # options:
    #  :all
    #  :tags
    #  :contains
    #  :debug
    #  :exact_match
    #  :dirty
    #  :abbrev
    #  :candidates
    #  :long
    #  :always
    #  :match
    #

### goat git revert (commitish) (opts) 
    # reverts the working directory to the provided commitish.
    # Accepts a range, such as comittish..HEAD
    #
    # options:
    #   :no_edit
    #

### goat git commit \[message\] (opts) 
    # commits all pending changes in the index file to the git repository
    # 
    # options:
    #   :all
    #   :allow_empty
    #   :amend
    #   :author
    #

### goat git commit_all \[message\] (opts) 
    # commits all pending changes in the index file to the git repository,
    # but automatically adds all modified files without having to explicitly
    # calling @git.add() on them.  

### goat git checkout (branch) (opts) 
    # checks out a branch as the new git working directory

### goat git checkout_file \[version\] \[file\] 
    # checks out an old version of a file

### goat git fetch (remote) (opts) 
    # fetches changes from a remote branch - this does not modify the working directory,
    # it just gets the changes from the remote if there are any

### goat git push (remote) (branch) (opts) 
    # pushes changes to a remote repository - easiest if this is a cloned repository,
    # otherwise you may have to run something like this first to setup the push parameters:
    #
    #  @git.config('remote.remote-name.push', 'refs/heads/master:refs/heads/master')
    #

### goat git merge \[branch\] (message) 
    # merges one or more branches into the current working branch
    #
    # you can specify more than one branch to merge by passing an array of branches

### goat git each_conflict {&block} 
    # iterates over the files which are unmerged

### goat git pull (remote) (branch) 
    # pulls the given branch from the given remote into the current branch
    #
    #  @git.pull                          # pulls from origin/master
    #  @git.pull('upstream')              # pulls from upstream/master
    #  @git.pull('upstream', 'develope')  # pulls from upstream/develop
    #

### goat git remotes 
    # returns an array of Git:Remote objects

### goat git add_remote \[name\] \[url\] (opts) 
    # adds a new remote to this repository
    # url can be a git url or a Git::Base object if it's a local reference
    # 
    #  @git.add_remote('scotts_git', 'git://repo.or.cz/rubygit.git')
    #  @git.fetch('scotts_git')
    #  @git.merge('scotts_git/master')
    #
    # Options:
    #   :fetch => true
    #   :track => <branch_name>

### goat git remove_remote \[name\] 
    # removes a remote from this repository
    #
    # @git.remove_remote('scott_git')

### goat git tags 
    # returns an array of all Git::Tag objects for this repository

### goat git add_tag \[name\] (*opts) 
    # Creates a new git tag (Git::Tag)
    # Usage:
    #     repo.add_tag('tag_name', object_reference)
    #     repo.add_tag('tag_name', object_reference, {:options => 'here'})
    #     repo.add_tag('tag_name', {:options => 'here'})
    #
    # Options:
    #   :a | :annotate -> true
    #   :d             -> true
    #   :f             -> true
    #   :m | :message  -> String
    #   :s             -> true
    #   

### goat git delete_tag \[name\] 
    # deletes a tag 

### goat git archive \[treeish\] (file) (opts) 
    # creates an archive file of the given tree-ish

### goat git repack 
    # repacks the repository

### goat git gc 

### goat git apply \[file\] 

### goat git apply_mail \[file\] 

### goat git show (objectish) (path) 
    # Shows objects
    #
    # @param \[String|NilClass\] objectish the target object reference (nil == HEAD)
    # @param \[String|NilClass\] path the path of the file to be shown
    # @return \[String\] the object information

### goat git with_index \[new_index\] 

### goat git with_temp_index {&blk} 

### goat git checkout_index (opts) 

### goat git read_tree \[treeish\] (opts) 

### goat git write_tree 

### goat git write_and_commit_tree (opts) 

### goat git update_ref \[branch\] \[commit\] 

### goat git ls_files (location) 

### goat git with_working \[work_dir\] 

### goat git with_temp_working {&blk} 

### goat git revparse \[objectish\] 
    # runs git rev-parse to convert the objectish to a full sha
    #
    #   @git.revparse("HEAD^^")
    #   @git.revparse('v2.4^{tree}')
    #   @git.revparse('v2.4:/doc/index.html')
    #

### goat git ls_tree \[objectish\] 

### goat git cat_file \[objectish\] 

### goat git current_branch 
    # returns the name of the branch the working directory is currently on

### goat git branch (branch_name) 
    # returns a Git::Branch object for branch_name

### goat git branches 
    # returns a Git::Branches object of all the Git::Branch 
    # objects for this repo

### goat git commit_tree (tree) (opts) 

### goat git diff (objectish) (obj2) 
    # returns a Git::Diff object

### goat git gblob \[objectish\] 

### goat git gcommit \[objectish\] 

### goat git gtree \[objectish\] 

### goat git log (count) 
    # returns a Git::Log object with count commits

### goat git object \[objectish\] 
    # returns a Git::Object of the appropriate type
    # you can also call @git.gtree('tree'), but that's 
    # just for readability.  If you call @git.gtree('HEAD') it will
    # still return a Git::Object::Commit object.  
    #
    # @git.object calls a factory method that will run a rev-parse 
    # on the objectish and determine the type of the object and return 
    # an appropriate object for that type 

### goat git remote (remote_name) 
    # returns a Git::Remote object

### goat git status 
    # returns a Git::Status object

### goat git tag \[tag_name\] 
    # returns a Git::Tag object

### goat git chdir 
    # changes current working directory for a block
    # to the git working directory
    #
    # example
    #  @git.chdir do 
    #    # write files
    #    @git.add
    #    @git.commit('message')
    #  end

### goat git config (name) (value) 
    #g.config('user.name', 'Scott Chacon') # sets value
    #g.config('user.email', 'email@email.com')  # sets value
    #g.config('user.name')  # returns 'Scott Chacon'
    #g.config # returns whole config hash

### goat git dir 
    # returns a reference to the working directory
    #  @git.dir.path
    #  @git.dir.writeable?

### goat git index 
    # returns reference to the git index file

### goat git repo 
    # returns reference to the git repository directory
    #  @git.dir.path

### goat git repo_size 
    # returns the repository size in bytes

### goat git set_index \[index_file\] (check) 

### goat git set_working \[work_dir\] (check) 

### goat git is_local_branch? \[branch\] 
    # returns +true+ if the branch exists locally

### goat git is_remote_branch? \[branch\] 
    # returns +true+ if the branch exists remotely

### goat git is_branch? \[branch\] 
    # returns +true+ if the branch exists

### goat git lib 
    # this is a convenience method for accessing the class that wraps all the 
    # actual 'git' forked system calls.  At some point I hope to replace the Git::Lib
    # class with one that uses native methods or libgit C bindings

### goat git grep \[string\] (path_limiter) (opts) 
    # will run a grep for 'string' on the HEAD of the git repository
    # 
    # to be more surgical in your grep, you can call grep() off a specific
    # git object.  for example:
    #
    #  @git.object("v2.3").grep('TODO')
    #
    # in any case, it returns a hash of arrays of the type:
    #  hsh\[tree-ish\] = \[\[line_no, match\], \[line_no, match2\]\]
    #  hsh\[tree-ish\] = \[\[line_no, match\], \[line_no, match2\]\]
    #
    # so you might use it like this:
    #
    #   @git.grep("TODO").each do |sha, arr|
    #     puts "in blob #{sha}:"
    #     arr.each do |match|
    #       puts "\t line #{match\[0\]}: '#{match\[1\]}'"
    #     end
    #   end

### goat git add (*args) 
    # updates the repository index using the working directory content
    #
    #    @git.add('path/to/file')
    #    @git.add(\['path/to/file1','path/to/file2'\])
    #    @git.add(:all => true)
    #
    # options:
    #   :all => true
    #
    # @param \[String,Array\] paths files paths to be added (optional, default='.')
    # @param \[Hash\] options

### goat git remove (path) (opts) 
    # removes file(s) from the git repository

### goat git reset (commitish) (opts) 
    # resets the working directory to the provided commitish

### goat git reset_hard (commitish) (opts) 
    # resets the working directory to the commitish with '--hard'

### goat git clean (opts) 
    # cleans the working directory
    #
    # options:
    #  :force
    #  :d
    #

### goat git describe (committish) (opts) 
    #  returns the most recent tag that is reachable from a commit
    #
    # options:
    #  :all
    #  :tags
    #  :contains
    #  :debug
    #  :exact_match
    #  :dirty
    #  :abbrev
    #  :candidates
    #  :long
    #  :always
    #  :match
    #

### goat git revert (commitish) (opts) 
    # reverts the working directory to the provided commitish.
    # Accepts a range, such as comittish..HEAD
    #
    # options:
    #   :no_edit
    #

### goat git commit \[message\] (opts) 
    # commits all pending changes in the index file to the git repository
    # 
    # options:
    #   :all
    #   :allow_empty
    #   :amend
    #   :author
    #

### goat git commit_all \[message\] (opts) 
    # commits all pending changes in the index file to the git repository,
    # but automatically adds all modified files without having to explicitly
    # calling @git.add() on them.  

### goat git checkout (branch) (opts) 
    # checks out a branch as the new git working directory

### goat git checkout_file \[version\] \[file\] 
    # checks out an old version of a file

### goat git fetch (remote) (opts) 
    # fetches changes from a remote branch - this does not modify the working directory,
    # it just gets the changes from the remote if there are any

### goat git push (remote) (branch) (opts) 
    # pushes changes to a remote repository - easiest if this is a cloned repository,
    # otherwise you may have to run something like this first to setup the push parameters:
    #
    #  @git.config('remote.remote-name.push', 'refs/heads/master:refs/heads/master')
    #

### goat git merge \[branch\] (message) 
    # merges one or more branches into the current working branch
    #
    # you can specify more than one branch to merge by passing an array of branches

### goat git each_conflict {&block} 
    # iterates over the files which are unmerged

### goat git pull (remote) (branch) 
    # pulls the given branch from the given remote into the current branch
    #
    #  @git.pull                          # pulls from origin/master
    #  @git.pull('upstream')              # pulls from upstream/master
    #  @git.pull('upstream', 'develope')  # pulls from upstream/develop
    #

### goat git remotes 
    # returns an array of Git:Remote objects

### goat git add_remote \[name\] \[url\] (opts) 
    # adds a new remote to this repository
    # url can be a git url or a Git::Base object if it's a local reference
    # 
    #  @git.add_remote('scotts_git', 'git://repo.or.cz/rubygit.git')
    #  @git.fetch('scotts_git')
    #  @git.merge('scotts_git/master')
    #
    # Options:
    #   :fetch => true
    #   :track => <branch_name>

### goat git remove_remote \[name\] 
    # removes a remote from this repository
    #
    # @git.remove_remote('scott_git')

### goat git tags 
    # returns an array of all Git::Tag objects for this repository

### goat git add_tag \[name\] (*opts) 
    # Creates a new git tag (Git::Tag)
    # Usage:
    #     repo.add_tag('tag_name', object_reference)
    #     repo.add_tag('tag_name', object_reference, {:options => 'here'})
    #     repo.add_tag('tag_name', {:options => 'here'})
    #
    # Options:
    #   :a | :annotate -> true
    #   :d             -> true
    #   :f             -> true
    #   :m | :message  -> String
    #   :s             -> true
    #   

### goat git delete_tag \[name\] 
    # deletes a tag 

### goat git archive \[treeish\] (file) (opts) 
    # creates an archive file of the given tree-ish

### goat git repack 
    # repacks the repository

### goat git gc 

### goat git apply \[file\] 

### goat git apply_mail \[file\] 

### goat git show (objectish) (path) 
    # Shows objects
    #
    # @param \[String|NilClass\] objectish the target object reference (nil == HEAD)
    # @param \[String|NilClass\] path the path of the file to be shown
    # @return \[String\] the object information

### goat git with_index \[new_index\] 

### goat git with_temp_index {&blk} 

### goat git checkout_index (opts) 

### goat git read_tree \[treeish\] (opts) 

### goat git write_tree 

### goat git write_and_commit_tree (opts) 

### goat git update_ref \[branch\] \[commit\] 

### goat git ls_files (location) 

### goat git with_working \[work_dir\] 

### goat git with_temp_working {&blk} 

### goat git revparse \[objectish\] 
    # runs git rev-parse to convert the objectish to a full sha
    #
    #   @git.revparse("HEAD^^")
    #   @git.revparse('v2.4^{tree}')
    #   @git.revparse('v2.4:/doc/index.html')
    #

### goat git ls_tree \[objectish\] 

### goat git cat_file \[objectish\] 

### goat git current_branch 
    # returns the name of the branch the working directory is currently on

### goat git branch (branch_name) 
    # returns a Git::Branch object for branch_name

### goat git branches 
    # returns a Git::Branches object of all the Git::Branch 
    # objects for this repo

### goat git commit_tree (tree) (opts) 

### goat git diff (objectish) (obj2) 
    # returns a Git::Diff object

### goat git gblob \[objectish\] 

### goat git gcommit \[objectish\] 

### goat git gtree \[objectish\] 

### goat git log (count) 
    # returns a Git::Log object with count commits

### goat git object \[objectish\] 
    # returns a Git::Object of the appropriate type
    # you can also call @git.gtree('tree'), but that's 
    # just for readability.  If you call @git.gtree('HEAD') it will
    # still return a Git::Object::Commit object.  
    #
    # @git.object calls a factory method that will run a rev-parse 
    # on the objectish and determine the type of the object and return 
    # an appropriate object for that type 

### goat git remote (remote_name) 
    # returns a Git::Remote object

### goat git status 
    # returns a Git::Status object

### goat git tag \[tag_name\] 
    # returns a Git::Tag object

## Skill: Document
### goat document markdown (skill) (task) 
    #
    # Generate markdown documentation
    #

