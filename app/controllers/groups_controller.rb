class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @assignment = Assignment.find(params[:assignment_id])
    @groups = Group.where(assignment_id: @assignment.id)
    s = Array.new
    @groups.each do |g|
      s.push(g.users).flatten!
    end
    @students = User.where(admin: false)
    @students = @students.reject{|student| s.include?(student)}

    @originals = Original.where(assignment_id: @assignment.id, group_id: nil)
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
    @assignment = Assignment.find(params[:id])
    @groups = Group.where(assignment_id: @assignment.id)
    @originals = Original.where(assignment_id: @assignment.id)
  end

  def update_groups
    params[:group_id].each do |student_id, group_id|
      user = User.find(student_id)
      group = Group.find(group_id)
      user.groups.destroy_all
      group.users.push(user)
    end

    redirect_to assignments_path, :flash=>{:notice=>"Groups have been saved."}
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @group.originals = Original.where(id: params[:original])
    respond_to do |format|
      if @group.save
        format.html { redirect_to :back, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the spooky internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:title, :assignment_id, :user_ids => [], :originals => [], originals_attributes: [:id, :title, :upload, :assignment_id, :language, :group_id, :stuff])
    end
end
