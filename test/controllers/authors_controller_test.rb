require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:one)
    @account = accounts(:one)
  end

  test "should get new" do
    get new_author_url
    assert_response :success
  end

  test "should create author with account" do
    assert_difference('Author.count') do
      post authors_url, params: { author: { name: @author.name,
                                            account_attributes: { email: "create@email.com", password: 'secret', password_confirmation: 'secret' } } }
    end

    assert_redirected_to author_url(Author.last)
  end

  test "should show author" do
    @author.account = @account
    get author_url(@author)
    assert_response :success
  end

  test "should get edit" do
    get edit_author_url(@author)
    assert_response :success
  end

  test "should update author" do
    patch author_url(@author), params: { author: { name: @author.name,
                                                   account_attributes: { email: "new@email.com", password: 'secret', password_confirmation: 'secret' } } }
    assert_redirected_to author_url(@author)
  end

  test "should destroy author" do
    assert_difference('Author.count', -1) do
      delete author_url(@author)
    end

    assert_redirected_to new_author_url
  end
end
