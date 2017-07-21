# Contributing #

Thank you for choosing to contribute to UWNerdist, I am really excited to see
what you have in mind. Here are a few helpful guidelines to get you started:

## How to start contributing ##

Before you begin, please make sure that you have read our [Code of
conduct](CODE_OF_CONDUCT.md) and GitHub's [How to contribute to open
source](https://opensource.guide/how-to-contribute/) guide.

1. **Get involved in the discussions**
Since this project is still in it's initial stages, we still have a lot of
important decisions to make. You can shape the future of this project right now
by participating in discussions and suggesting new features that we can work on
for the first release.
2. **Design**
This is an open field right now, I have worked with designers before but am not
a designer so I am looking for someone who can take a lead on this and drive the
entire look and feel of the app. This is seriously a rare opportunity and if you
are a designer looking to improve your skills and your resume, this is a great
opportunity for you!
3. **Impove the docs**
A contribution can be as simple as fixing a typo in the project docs, rewriting
unclear sections or write something from scratch for a new feature. Doc changes
do not require tests so there is no reason for you to not contribute!
4. **Develop**
Whether you are a seasoned Rails developer or just getting started with coding,
UWNerdist has plenty to offer. For those just getting started, Ruby is a great
first language to learn, it's simple, robust and just fun to write in! Rails,
the framework that I am using for this project (which also happens to be written
in Ruby) is easy to pick up and a must to master if you want to work in the Ruby
community. I find that these two are tightly coupled and so there is no reason
to neglect one if you know the other.
For those who are looking for a challenge, this project has only just begun so
you get to make a lot of important engineering decisions i.e. real decisions
that actually make a difference. If you are already familiar with Rails then
also consider learning some front end work, I am hoping to use React for this
project. The same goes to those who already know front end, there is no harm in
learning some Rails.

## Setting up your development environment ##
If you have decided to contribute by writing some code or want to browse the
source code, you must set up a development environment on your local machine,
here is how you do that.
Before you begin, make sure to read the [How to submit a
contribution](https://opensource.guide/how-to-contribute/#how-to-submit-a-contribution) section
of the GitHub guide.

1. **Install Ruby**
There are various ways to get Ruby on your machine, the [official
website](https://www.ruby-lang.org/en/documentation/installation/) highlights
various strategies. If you don't care how you install Ruby, I recommend [chruby](https://github.com/postmodern/chruby).
When you start contributing to multiple Ruby projects, you will need to have
multiple versions of Ruby on your system and chruby helps you do exactly that,
it's a Ruby version manager.
**We are using Ruby version 2.4.1 but any 2.4.x version will do.**

2. **Fork the project**
Use [this guide](https://guides.github.com/activities/forking/) if you have not
forked a project before. I highly recommend that you use ssh over http, if you
haven't authenticated over ssh before, [this
guide](https://help.github.com/articles/connecting-to-github-with-ssh/) can come
in handy.

3. **Install the dependencies**
Once you have cloned the project successfully, `cd` into the project directory
and install the bundler gem followed by the dependencies using the bundle command:

```shell
gem install bundler
bundle install
```

4. **Start coding!**
You are all done! You can fire up the rails console with `bin/rails console` or
the server with `bin/rails server` to make sure everything is working. Read the
[opening a pull request](#opening-a-pull-request) and [opening an
issue](opening-an-issue) to learn how to get started with working on issues and
feature requests.

## Opening a pull request ##

Please make sure to read the [Opening a pull
request](https://opensource.guide/how-to-contribute/#opening-a-pull-request)
section of the GitHub guide.

1. Write tests
2. Write code that makes the test pass
3. Run the entire test suite to make sure everything is green

## Opening an issue ##

Please make sure to read the [Opening an
issue](https://opensource.guide/how-to-contribute/#opening-an-issue) section on
the GitHub guide.

1. Give it a constructive and meaningful title
2. Explain the problem in detail, include ample amounts of context and background
   when needed. **Screenshots are a must for UI bugs**.
3. This guide on [How to write in
   markdown](https://guides.github.com/features/mastering-markdown/) might come in handy.
