require 'thor'

module GithubSniffer
  module Cli
    class Application < Thor

      desc 'test NAME', 'test name'
      def test(name)
        greeting = "Test is fine, #{name}"
        puts greeting
      end

    end # Application
  end # Cli
end # GithubSniffer
