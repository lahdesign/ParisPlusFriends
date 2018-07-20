class ProposalsController < ProtectedController
  # before_action :authenticate!
  before_action :set_proposal, only: [:show, :update, :destroy]

  # making it protected so that is can't be accessed unless you are signed in
  def index
    @proposals = current_user.proposals

    render json: @proposals
  end

  # GET /proposals/1
  def show
    render json: @proposal
  end

  # POST /proposals
  def create
    @proposal = current_user.proposals.build(proposal_params)
    # @bucketlist = Bucketlist.new(bucketlist_params)
    # @bucketlist.user_id = 1
    # @bucketlist.user_id = current_user
    p current_user

    if @proposal.save
      render json: @proposal, status: :created, location: @proposal
    else
      render json: @proposal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /proposals/1
  def update
    if @proposal.update(proposal_params)
      render json: @proposal
    else
      render json: @proposal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /proposals/1
  def destroy
    @proposal.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal
      @proposal = Proposal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def proposal_params
      params.require(:proposal).permit(:user_id, :project_title, :question_one, :question_two, :question_three)
    end
end
