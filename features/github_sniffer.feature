Feature: Display the given parameter username with a result of preferred languages.
  Scenario: First Run
    Display the user with a given username the preferred languages
      When I successfully run `github_sniffer dominant_language test`
      Then the output should contain "test has php, objective-c, matlab as main language/s in 1 repo/s."

      When I successfully run `github_sniffer dominant_language invalid-user`
      Then the output should contain "invalid-user has no repos."

      When I successfully run `github_sniffer dominant_language no-user`
      Then the output should contain "not found!"
