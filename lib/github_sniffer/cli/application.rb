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
        languages = {}

        # Cyle throug repos and sum up the main language
        github.repos.list.each do |repo|
          repo_language = repo.language.to_s.downcase!

          languages[repo_language] = 0 if languages[repo_language].nil?
          languages[repo_language] += 1
        end

        prefered_lang = languages.sort_by{ |_k, value| value }.last

        p "#{username} has #{prefered_lang[0]} as main language in #{prefered_lang[1]} repos."
      end

    end # Application
  end # Cli
end # GithubSniffer
