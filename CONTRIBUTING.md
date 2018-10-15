# Contributing

This document outlines how to get the application set up
and how we continuously ship working software.

This document also outlines the process for members the
development team.

## Getting Set Up

### Ruby on Rails

This application is built using [Ruby on Rails].

Your system will require [Ruby] to develop on the application.

The required Ruby version is listed in the [.ruby-version](.ruby-version) file.

If you do not have this binary, [use this guide to get set up on MacOS].

[Ruby on Rails]: http://rubyonrails.org
[Ruby]: https://www.ruby-lang.org/en/
[use this guide to get set up on MacOS]: http://installfest.railsbridge.org/installfest/macintosh

### Configuring the Application

* After cloning this repo, run: `bin/setup`.

### Onboarding Checklist

Ask the team for access to the following services to begin contributing:

* GitHub
* Slack
* Mailgun
* Trello
* Heroku
* Get calendar invites to: daily standup, weekly planning, weekly retro


## Day-to-day Development

### Local Server

* Run the server(s): `foreman start`
* Visit [your local server](http://localhost:3000)
* Run tests: `rake`


### Deploying

See [DEPLOYING.md](DEPLOYING.md)

## Workflow

### Planning

* A change is initiated and discussed via a
  [Trello](https://trello.com/b/9p76bIJk/vacancy-travel) card.
* All new Trello cards are added to the "Inbox" Trello list.
* During a weekly planning meeting, prioritized Trello cards are added to the
  "This week" Trello list. Cards in this list should have enough detail to be
  actionable. Top priority items are at the top of the list.
* During the team's weekly retro meetings, feedback about the workflow is noted
  and related changes are incorporated into this document.


### Bugs

A problem is first noticed, e.g. Alert comes in, team member pings us "I haven't seen text messages coming in over the weekend. Something might be wrong."
Person who noticed the problem, writes a ticket with a "Bug Triage" label and puts it at the top of the Up Next column.

An engineer taking the next ticket will triage the ticket. They investigate it, add some description of the problem. The purpose of this investigation is to
figure out when it should be worked on.

#### Apply the correct Trello label

| Label      | Severity | Action |
| ------------- | -----------| ----- |
| P1 | Severe bug. (e.g. the site is down, apps are at risk of not being delivered) | Should be fixed immediately |
| P2 | Some negative impact on users | Should be placed on top of Ready column (PM may increase priority) |
| P3 | No big impact, low priority | Place in backlog |

### Work In Process

* When someone starts working on a task, they move the Trello card into "In
  Progress" and assign themselves so that others know they are working on it.
* All code is written on a branch *other* than `master`. The team is not picky
  about branch naming, but prefixing with initials can be nice.

### Debugging

* Call `binding.pry` anywhere in the code to stop execution and get a debugger console.
* Access an IRB console on exception pages or by using `<%= console %>` anywhere in the code.


### Code Review

* A Pull Request (PR) is created on GitHub. All PRs should have [a good commit
  message](https://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message).
* The PR Author can request reviews via GitHub's [request a pull request
  review](https://help.github.com/articles/requesting-a-pull-request-review/)
feature. In general, the team prioritizes code reviews over other work.
* Before a PR can be merged into `master` it must:
  * Have been QA'd locally by the PR author.
  * Pass checks for CI, if installed.
  * Have the explicit approval of one or more teammates via GitHub's approval
    feature.

### Merging

* By default, it is expected that the PR author will merge when ready. In some
  cases, a reviewer may merge if merging is time-sensitive or the author is
  unavailable to merge for some reason.
* Whoever merges a branch into `master` deletes the branch after merging.
* When two people are pairing on something, code can be merged to `master`
  without an explicit PR / code review process.
* Merged code should be deployed to staging immediately.

### Acceptance Testing

* Before deploying to production, we ask a teammate who _did not_ work on the feature to test our change on staging.
* Ideally, the story author has put explicit acceptance steps into the card.
* Assign yourself to the card, so others know you're testing.
* Spin up staging and follow the acceptance tests.
* If all looks well, move to the "Done" column.
* If you have a question, ask it in the card and label the card "Blocked".
* If not, comment as to why and bump back to "In Process".
