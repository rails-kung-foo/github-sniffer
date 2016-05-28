require 'spec_helper'

describe GithubSniffer do
  let(:valid_user) { Github.new(user: 'test') }
  let(:no_user_at_all) { Github.new(user: 'no-user-at-all') }
  let(:invalid_user) { Github.new(user: 'invalid-user') }

  it 'has a version number' do
    expect(GithubSniffer::VERSION).not_to be nil
  end

  describe 'with valid user' do
    context 'instance methods' do
      context '.dominant_language' do
        before :each do
          valid_user
        end

        it 'returns the correct value: [["php", "objective-c", "matlab"], 1]' do
          expect(valid_user.repos.dominant_language).to include(["php", "objective-c", "matlab"], 1)
        end
      end # .dominant_language
    end # instance methods
  end # with valid user

  describe 'with invalid user' do
    context 'instance methods' do
      context '.dominant_language' do
        before :each do
          invalid_user
          no_user_at_all
        end

        it 'no user at all raises error: ...404 Not Found' do
          expect{ no_user_at_all.repos.dominant_language }.to raise_error('GET https://api.github.com/users/no-user-at-all/repos: 404 Not Found')
        end

        it 'invalid repo data returns nil: nil' do
          expect(invalid_user.repos.dominant_language).to be_nil
        end
      end # .dominant_language
    end # instance methods
  end # with invalid user
end # describe GithubSniffer
