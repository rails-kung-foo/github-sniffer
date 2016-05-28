module GithubSniffer
  module GithubExtension
    # We add our own method to the api.
    # Github.new.repos.class returns our desired class
    Github::Client::Repos.class_eval do

      # returns dominant language from all repositories.
      # Github.new(user: NAME).repos.dominant_language
      # ['lang', count]
      def dominant_language
        languages = {}

        # Cycle through repos and sum up the main language
        self.list.each do |repo|
          repo_language = repo.language.to_s.downcase!

          languages[repo_language] = 0 if languages[repo_language].nil?
          languages[repo_language] += 1
        end

        # The key is the language name and value is the count,
        # we return the highest count for a langauge
        languages.sort_by{ |_k, value| value }.last
      end
    end # Github::Client::Repos
  end # GithubExtension
end # GithubSniffer
