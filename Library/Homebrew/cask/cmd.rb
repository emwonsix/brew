# typed: true
# frozen_string_literal: true

require "optparse"
require "shellwords"

require "cli/parser"
require "extend/optparse"

require "cask/config"

require "cask/cmd/abstract_command"
require "cask/cmd/audit"
require "cask/cmd/install"
require "cask/cmd/reinstall"

module Cask
  # Implementation of the `brew cask` command-line interface.
  #
  # @api private
  class Cmd
    extend T::Sig

    include Context

    def self.parser(&block)
      Homebrew::CLI::Parser.new do
        instance_eval(&block) if block

        cask_options
      end
    end
  end
end
