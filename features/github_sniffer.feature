Feature: Display the given parameter username with a result of preferred languages.
  Scenario: First Run
    Display the user with a given username the preferred languages
      When I successfully run `github_sniffer dl rails-kung-foo`
      Then the output should contain "rails-kung-foo has ruby as main language/s in 3 repos."

      When I successfully run `github_sniffer dls rails-kung-foo`
      Then the output should contain "rails-kung-foo has ruby as main language/s in 3 repos."
