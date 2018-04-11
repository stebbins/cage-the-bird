FakeUser = Struct.new(:name)

class FakeClient
  attr_accessor :consumer_key, :consumer_secret, :access_token,
    :access_token_secret, :user, :return_item
  attr_reader :erased

  def initialize
    @user = fake_user
    @erased = false
  end

  def favorites(_count)
    fake_returns
  end

  def user_timeline(_user, _params)
    fake_returns
  end

  def retweeted_by_me(_count)
    fake_returns
  end

  def unfavorite(_item)
    @erased = true
    []
  end

  def unretweet(_item)
    @erased = true
    []
  end

  def destroy_status(_item)
    @erased = true
    []
  end

  private

  def fake_user
    FakeUser.new("fake_username")
  end

  def fake_returns
    return_item ? [:item] : []
  end
end
