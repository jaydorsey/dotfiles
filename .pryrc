# -*- mode: ruby -*- vim:set ft=ruby:

Pry.config.prompt = proc { |obj, nest_level, _| "pry >> " }
