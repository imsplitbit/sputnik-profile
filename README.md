# Sputnik

Sputnik is a set of tools for programmatically managing your development environment.
By applying the principle of *infrastructure as code* to your personal workstation it makes
the process of maintaining it both deterministic and modular.

## Determinism and Repeatability

As a developer, you lovingly, iteratively, and relentlessly customize your
workstation to fit your ever evolving needs like a glove. As time passes and your
expertise grows this can come to represent hundreds, if not thousands, of hours in
careful research, experimentation and configuration. This includes shells, editors,
editor plugins, syntax highlighters, utilities, languages, language libraries,
system libraries, servers, daemons, etc... Cross each of those with its unique
configuration as it resides on your box and you have a lot of accrued knowledge
sitting on the table. We call this knowledge your Developer DNA.

Where (besides an incomplete copy in your head), is this hard-won knowledge encoded?
What if you were to buy a new computer tomorrow? How long would it take for you
to faithfully replicate something resembling your development environment?
Certainly you could do it again from memory, but it would never quite be the same and
the process would be arduous and error prone. We've all had those "Oh yeah! I remember now. I need
to have version a.b.c of library X before I can use program Y" before. Individually
they can be easily dealt with, but taken together can eat up hours.

Sputnik allows you to maintain a programatic description of your personal development
infrastructure under source control. In this way, your entire environment, from shell colors
and preferences to application frameworks, can be built from scratch on any supported
operating system and hardware in a matter of minutes and with only a single command:

    sputnik launch


## Modularity and Shareability

A key benefit of the Sputnik model is not just the ability to retain the knowledge
you have acquired in making your own development environment, but also the ability
to *share* what you have learned with others and benefit from what others have
learned in kind.

Sputnik has the concept of composable profiles which can be developed and shared
via a github. Each profile is thin wrapper around a chef recipe which can be configured
with a builder-like syntax.

## Implementation

Sputnik is an experimental work with several different prototypes. No design decision
is set in stone and we're looking for people like you to steer the course we eventually
take. If this is a problem you want to see solved then please! Join up with us on the
Dell tech center or at one of our informal get togethers listed below.

### Getting Started [Proposed]

The sputnik command line tools are available as [rubygems][6]

    gem install sputnik-cli

If you have not yet initialized your developer you can do so now.

    sputnik init

This will create your `Sputnikfile` in `~/.sputnik/Sputnikfile`. This file serves
as a manifest for all of the developer profiles that you want installed combined
with their configurations.

The default `Sputnikfile` looks like this:

    # The default source of profile information. Multiple sources may
    # be specified
    source "git://github.com/sputnik/sputnik-profiles"

Most workstations come preconfigured with bash as the default shell. But let's say
that we want to use [Zsh][7] instead. Luckily there's a profile for that. We can
add it to our Sputnikfile

    profile :zsh

Now, we can realize all of the changes in

    sputnik launch

This will do two things. First, it will ensure that the actual `zsh` package is
installed on your operating system, and second, update your preferences to set it
as your default login shell.


## Inspiration

The ideas behind Sputnik are not novel, only their domain of application. Direct
inspiration was drawn from [Pivotal Workstation][1] and in particular [a talk at ChefConf 2012][2]
given by [Matt Kocher][3] as well as [Instant Infrastructure][4] by [Chris McClimans][5]

## Sponsorship

![http://dell.com](https://raw.github.com/mattray/sputnik-demo-repo/master/cookbooks/demo-app/files/default/dell.png)


The Sputnik Project is graciously sponsored by Dell.


[1]: https://github.com/pivotal/pivotal_workstation
[2]: http://www.youtube.com/watch?v=kfQy8UzBUvY&feature=plcp
[3]: https://github.com/mkocher
[4]: https://github.com/hh/ii-repo
[5]: https://github.com/hh
[6]: https://rubygems.org
[7]: https//zsh.sourceforge.net