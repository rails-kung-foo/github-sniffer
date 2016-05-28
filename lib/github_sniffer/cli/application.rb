require 'thor'

module GithubSniffer
  module Cli
    class Application < Thor

      desc 'dominant_language USERNAME', 'Returns github profile of user'
      def dominant_language(username)
        prefered_lang = Github.new(user: username).repos.dominant_language
        p "#{username} has #{prefered_lang[0].join(', ')} as main language/s in #{prefered_lang[1]} repos."
      rescue Github::Error::NotFound
        p "#{username} not found!"
      end

      map dl: :dominant_language

    end # Application
  end # Cli
end # GithubSniffer
