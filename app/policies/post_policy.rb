class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # a user can see all the post
      @scope.all
    end
  end

  def create?
    # only the admin can create a new post
    user_is_admin?
  end

  def show?
    # a user can see any post
    true
  end

  def update?
    # only the admin can update an existing post
    user_is_admin?
  end

  def destroy?
    # only the admin can destroy a new post
    user_is_admin?
  end

  private

  def user_is_admin?
    @user.admin?
  end
end
