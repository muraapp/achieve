module BlogsHelper
    def choose_new_or_edit
        if action_name == 'new' || action_name == 'confirm'
            confirm_blogs_path
        elsif
            blogs_path
        end
    end
end
