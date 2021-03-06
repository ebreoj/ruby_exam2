class GroupsController < ApplicationController
	def groups
		redirect_to_root_path if no_current_user
		@groups = Group.all
	end

	def create
        new_group = User.find(current_user.id).groups.new(group_params)
        # new_group = Group.new(group_params)
        # new_group.user = current_user
        if new_group.save
            User.find(current_user.id).joins.create(group:Group.find(new_group.id))
            redirect_to "/groups"
        else
            flash[:errors] = new_group.errors.full_messages
            redirect_to "/groups"
        end
    end

	def destroy
        Group.find(params[:group_id]).destroy
        redirect_to "/groups"
    end

	def show
        redirect_to :root if no_current_user
        @group = Group.find(params[:group_id])
    end

    def join
        User.find(current_user.id).joins.create(group:Group.find(params[:group_id]))
        redirect_to "/groups/#{params[:group_id]}"
    end
    def unjoin
        User.find(current_user.id).joins.find_by(group:Group.find(params[:group_id])).destroy
        redirect_to "/groups/#{params[:group_id]}"
    end


	private
	def group_params
        params.require(:group).permit(:name, :description)
    
	end
end
