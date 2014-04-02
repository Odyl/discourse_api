require 'spec_helper'

describe DiscourseApi::API::Topics do
  subject { DiscourseApi::Client.new("http://localhost") }

  describe "#hot_topics" do
    pending 'depreicated?'
  end

  describe "#invite_user_to_topic" do
    pending "needs to have a test written for it"
  end

  describe "#latest_topics" do
    before do
      stub_get("http://localhost/latest.json?api_key&api_username").to_return(body: fixture("latest.json"), headers: { content_type: "application/json" })
    end

    it "requests the correct resource" do
      subject.latest_topics
      expect(a_get("http://localhost/latest.json?api_key&api_username")).to have_been_made
    end

    it "returns the requested topics" do
      topics = subject.latest_topics
      expect(topics).to be_an Array
      expect(topics.first).to be_a Hash
    end
  end

  describe "#new_topics" do
    before do
      stub_get("http://localhost/new.json?api_key&api_username").to_return(body: fixture("new.json"), headers: { content_type: "application/json" })
    end

    it "requests the correct resource" do
      subject.new_topics
      expect(a_get("http://localhost/new.json?api_key&api_username")).to have_been_made
    end

    it "returns the requested topics" do
      topics = subject.new_topics
      expect(topics).to be_an Array
      expect(topics.first).to be_a Hash
    end
  end

  describe "#topic" do
    before do
      stub_get("http://localhost/t/57.json?api_key&api_username").to_return(body: fixture("topic.json"), headers: { content_type: "application/json" })
    end

    it "requests the correct resource" do
      subject.topic(57)
      expect(a_get("http://localhost/t/57.json?api_key&api_username")).to have_been_made
    end

    it "returns the requested topic" do
      topic = subject.topic(57)
      expect(topic).to be_a Hash
      expect(topic["id"]).to eq(57)
    end
  end

  describe "#topics_by" do
    before do
      stub_get("http://localhost/topics/created-by/test_user.json?api_key&api_username").to_return(body: fixture("topics_created_by.json"), headers: { content_type: "application/json" })
    end

    it "requests the correct resource" do
      subject.topics_by('test_user')
      expect(a_get("http://localhost/topics/created-by/test_user.json?api_key&api_username")).to have_been_made
    end

    it "returns the requested topics" do
      topics = subject.topics_by('test_user')
      expect(topics).to be_an Array
      expect(topics.first).to be_a Hash
    end
  end
end