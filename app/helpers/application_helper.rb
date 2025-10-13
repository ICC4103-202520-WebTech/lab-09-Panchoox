module ApplicationHelper
    def user_displayName(user)
        user.name.presence || user.email
    end
end
