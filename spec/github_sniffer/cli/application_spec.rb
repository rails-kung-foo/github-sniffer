require 'spec_helper'

describe GithubSniffer::Cli::Application do
  let(:new_instance) { GithubSniffer::Cli::Application.new }

  describe "creating new instance" do
    context "command" do
      {
        'test': 'has php, objective-c, matlab as main language/s in 1 repo/s.',
        'no-user-at-all': 'not found!',
        'invalid-user': 'has no repos.'
      }.each do |user, message|
        context ".dominant_language" do
          context "called with argument: #{user}" do
            before :each do
              new_instance
            end

            it "returns message: #{message}" do
              expect(new_instance.dominant_language(user)).to eq("#{user} #{message}")
            end
          end
        end
      end # each
    end # command
  end # creating new instance
end # Application
