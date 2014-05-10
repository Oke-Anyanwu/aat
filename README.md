Another Admin Tool
==================

Just how many times do I have to write this type of application?

I created this project to document the steps I took to setup a back-office application.

### Essential gems

* [paper_trail](https://github.com/airblade/paper_trail)

### Testing and debugging gems

### Principles

1. Namespace by audience. Keep routes (and features) separate by considering who will be the primary consumer. For starters, I have a `superuser`
that acts as a site-wide administrator.

2. Do not reinvent the wheel. I think most of what I need for this app is already built. What I need to do is to build a cohesive user interface.

3. Pleasant programming experience. I notice that internal applications suffer from either over-design or lack of attention. I would like to avoid the
Cobbler's Children Syndrome.

4. Do not overbuild. Each line of code, database column, API endpoint is another that I (or some hapless fellow) would have to maintain.
