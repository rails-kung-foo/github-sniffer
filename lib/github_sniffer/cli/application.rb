require 'thor'

module GithubSniffer
  module Cli
    class Application < Thor
      desc 'get_user USERNAME', 'Returns github profile of user'
      def get_user(username)
        prefered_lang = Github.new(user: username).repos.dominant_language

        p "#{username} has #{prefered_lang[0].join(', ')} as main language/s in #{prefered_lang[1]} repos."
      end
    end # Application
  end # Cli
end # GithubSniffer
