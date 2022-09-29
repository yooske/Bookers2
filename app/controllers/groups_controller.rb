class GroupsController < ApplicationController
  def index
    @book = Book.new
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.users << current_user
    if @group.save
     redirect_to groups_path
    else
      render :new
    end
  end

  def join
    @group = Group.find(params[:group_id])
    @group.users << current_user
    redirect_to  groups_path
  end

  def leave
    @group = Group.find(params[:group_id])
    @group.users.delete(current_user)
    redirect_to groups_path
  end

  def show
    @book = Book.new
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.owner_id == current_user.id
      if @group.update(group_params)
        redirect_to group_path(@group)
      else
        render :edit
      end
    else
      redirect_to groups_path
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.owner_id == current_user.id
      @group.destroy
      redirect_to groups_path
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end

  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id ==current_user.id
      redirect_to groups_path
    end
  end
end
