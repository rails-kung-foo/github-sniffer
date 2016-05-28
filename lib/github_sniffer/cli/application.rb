require 'thor'

module GithubSniffer
  module Cli
    class Application < Thor
      
      desc 'dominant_language USERNAME', 'Returns users mosed used programming language.'
      def dominant_language(username)
        prefered_lang = Github.new(user: username).repos.dominant_language

        dominant_language_response(username: username, prefered_lang: prefered_lang)
      rescue Github::Error::NotFound
        p "#{username} not found!"
      end

      map dl: :dominant_language

     no_tasks do
       def dominant_language_response(username:, prefered_lang:)
         return p "#{username} has no repos." if prefered_lang.nil?

         p "#{username} has #{prefered_lang[0].join(', ')} as main language/s in #{prefered_lang[1]} repo/s."
       end
     end # no_task

    end # Application
  end # Cli
end # GithubSniffer
