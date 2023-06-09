require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? should return true for draft posts" do
    assert BlogPost.new(published_at: nil).draft?
  end

  test "draft? should return false for published posts" do
    refute BlogPost.new(published_at: 1.year.ago).draft?
  end

  test "draft? should return false for scheduled posts" do
    refute BlogPost.new(published_at: 1.year.from_now).draft?
  end

  test "published? should return true for published posts" do
    assert BlogPost.new(published_at: 1.year.ago).published?
  end

  test "published? should return false for draft posts" do
    refute BlogPost.new(published_at: nil).published?
  end

  test "published? should return false for scheduled posts" do
    refute BlogPost.new(published_at: 1.year.from_now).published?
  end 

end

