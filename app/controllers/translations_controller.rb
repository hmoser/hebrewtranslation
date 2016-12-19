class TranslationsController < ApplicationController
  before_action :set_translation, only: [:show, :edit, :update, :destroy]

  # GET /translations
  # GET /translations.json
  def index
    @translation = Translation.new
    @translations = Translation.all
    @assignment = Assignment.find(params[:assignment_id])
    Group.where(assignment_id: @assignment.id).each do |group|
      if group.users.include?(current_user)
        @group = group
      end
    end
    if !@group.nil?
      @original = Original.where(group_id: @group.id).first    
    end
  end

  # GET /translations/1
  # GET /translations/1.json
  def show
    @translation = Translation.find(params[:id])
    @original = Original.find(@translation.original_id)
    @assignment = Assignment.find(@original.assignment_id)
    @group = Group.find(@original.group_id)
    @groups = Group.where(assignment_id: @assignment.id)
    if(@group == @groups.last)
      @neworiginal = @groups.first.originals.first 
    else
      @neworiginal = Group.find(@original.group_id + 1).originals.first
    end

    @translations = Translation.where(original_id: @neworiginal.id)
    t = Array.new
    @translations.each do |x|
      t.push(x.rankings).flatten!
    end
    @translations = @translations.reject{|translation| t.include?(Ranking.where(translation_id: translation.id, user_id: current_user.id).first)}
    @newtranslation = @translations.first
  end

  # GET /translations/new
  def new
    @translation = Translation.new
  end

  # GET /translations/1/edit
  def edit
  end

  # POST /translations
  # POST /translations.json
  def create
    @translation = Translation.new(translation_params)

    respond_to do |format|
      if @translation.save
        format.html { redirect_to action: "show", id: @translation.id, assignment_id: params[:assignment_id], original_id: params[:original_id]}
        format.json { render :show, status: :created, location: @translation }
      else
        format.html { render :new }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /translations/1
  # PATCH/PUT /translations/1.json
  def update
    respond_to do |format|
      if @translation.update(translation_params)
        format.html { redirect_to @translation, notice: 'Translation was successfully updated.' }
        format.json { render :show, status: :ok, location: @translation }
      else
        format.html { render :edit }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /translations/1
  # DELETE /translations/1.json
  def destroy
    @translation.destroy
    respond_to do |format|
      format.html { redirect_to translations_url, notice: 'Translation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_translation
      @translation = Translation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def translation_params
      params.require(:translation).permit(:user_id, :original_id, :translation, :assignment_id)
    end
end
