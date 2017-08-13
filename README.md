# Github SLOC

Find Out How Many SLOC You've Contributed to Github

[![Travis CI](https://img.shields.io/travis/karagenit/github-fastforward.svg?style=flat-square)](https://travis-ci.org/karagenit/github-fastforward)
[![Gem Version](https://img.shields.io/gem/v/github_sloc.svg?style=flat-square)](https://rubygems.org/gems/github_sloc)
[![Gem](https://img.shields.io/gem/dt/github_sloc.svg?style=flat-square)](https://rubygems.org/gems/github_sloc)

## Installation

```
$ gem install github_sloc
```

Will install the `octokit` gem as a dependency.

## Usage

Sample usage/output:

```
$ github_sloc
Username: *****
Password: *****
----------
Repository                               Adds       Dels       Commits
----------
you/repo                                 (+5000)    (-3000)    (:120)
you/other-repo                           (+100)     (-50)      (:5)
----------
Total                                    (+5100)    (-3050)    (:125)
```
