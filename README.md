# BirthControl

Count active record instantiations and report them to the log.

## Installation

Add this line to your application's Gemfile:

    gem 'birth_control', groups: [:development]

And then execute:

    $ bundle

After bundling you'll need to enable the logging by putting this line into your development environment:

    BirthControl.enable = true

## Usage

Two new reports will be logged into your rails log:

1. The class instantiation report - count all active record objects by class and in total
2. Duplication report - reveals where active record objects were loaded more than once

### Example reports:

This example show the result of a project detail page. You can see, that there were 5 project instantiations but always the same project. The first two may be necassary, but the later 3 could have been avoided.

    *** [BirthControl] Class instantiation overview ***
        5 Projects
       20 ProjectPictures
        2 Users
        1 Countries
        3 BlogPosts
       30 Total

    *** [BirthControl] Duplicate instantiation detected ***

    Project(42) - 5 times
      1. app/controllers/projects_controller.rb:27:in `load_project_for_caching'
      2. app/controllers/projects_controller.rb:13:in `show'
      3. app/views/projects/_blog_post.html.slim:3:in `...'
      4. app/views/projects/_blog_post.html.slim:3:in `...'
      5. app/views/projects/_blog_post.html.slim:3:in `...'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Changelog

**0.0.1** (*2013-11-16*)
* Initial import, basic reports
