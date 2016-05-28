require 'thor'

module GithubSniffer
  module Cli
    class Application < Thor

      desc 'test NAME', 'test name'
      def test(name)
        greeting = "Test is fine, #{name}"
        puts greeting
      end

      desc 'get_user USERNAME', 'Returns github profile of user'
      def get_user(username)
        github = Github.new(user: username)

        p github
      end

    end # Application
  end # Cli
end # GithubSniffer
