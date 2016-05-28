module GithubSniffer
  module GithubExtension

    # We add our own method to the api.
    # Github.new.repos.class returns our desired class to extend
    Github::Client::Repos.class_eval do

      # returns dominant language from all repositories.
      # Github.new(user: NAME).repos.dominant_language
      # [['ruby', 'c++'], count]
      def dominant_language
        languages = {}

        # Cycle through repos and sum up the main language
        self.list.each do |repo|
          next if repo.language.nil?

          repo_language = repo.language.downcase!

          languages[repo_language] = 0 if languages[repo_language].nil?
          languages[repo_language] += 1
        end

        count = languages.values.max

        # send nil back if user has no repos
        return nil if count.nil?

        # possible that multiple languages have the same number.
        [languages.select{ |_k, value| value == count }.keys, count]
      end
    end # Github::Client::Repos
  end # GithubExtension
end # GithubSniffer
