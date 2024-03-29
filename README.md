Another Admin Tool
==================

Just how many times do I have to write this type of application?

I created this project to document the steps I took to setup a back-office application.

### Essential gems

* [paper_trail](https://github.com/airblade/paper_trail)
* [rails_admin](https://github.com/sferik/rails_admin)
* [devise](https://github.com/plataformatec/devise)
* [foundation-rails](https://github.com/zurb/foundation-rails)

### Testing and debugging gems

We're using [SimpleCov](https://github.com/colszowka/simplecov) for test coverage reports

1. Run tests using `rake spec cucumber`

2. `$ open coverage/index.html`

### Principles

1. Do not reinvent the wheel. I think most of what I need for this app is already built. What I need to do is to build a cohesive user interface.

2. Pleasant programming experience. I notice that internal applications suffer from either over-design or lack of attention. I would like to avoid the
Cobbler's Children Syndrome.

3. Do not overbuild. Each line of code, database column, API endpoint is another that I (or some hapless fellow) would have to maintain.
