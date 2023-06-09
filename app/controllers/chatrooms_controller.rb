class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: %i[ show edit update destroy ]

  # GET /chatrooms or /chatrooms.json
  def index
    @chatrooms = Chatroom.all
   
    # console 
    # debugger
  end

  # GET /chatrooms/1 or /chatrooms/1.json
  def show
    # debugger
  end

  # GET /chatrooms/new
  def new
    @chatroom = Chatroom.new
  end

  # GET /chatrooms/1/edit
  def edit
  end

  # POST /chatrooms or /chatrooms.json
  def create
    @chatroom = Chatroom.new(chatroom_params)
    # logger.debug "New chatroom: #{@chatroom.attributes.inspect}"
    # logger.debug "chatroom should be valid: #{@chatroom.valid?}"

    respond_to do |format|
      if @chatroom.save
        # logger.debug "The chatroom was saved and now the user is going to be redirected..."
        format.html { redirect_to chatroom_url(@chatroom), notice: "Chatroom was successfully created." }
        format.json { render :show, status: :created, location: @chatroom }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chatroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chatrooms/1 or /chatrooms/1.json
  def update
    respond_to do |format|
    
      # for loger beduging check console below line printed in console.

      # logger.debug "Person attributes hash: #{@chatroom.attributes.inspect}"
      # logger.info "Processing the request..."
      # logger.fatal "Terminating application, raised unrecoverable error!!!"

      if @chatroom.update(chatroom_params)
        format.html { redirect_to chatroom_url(@chatroom), notice: "Chatroom was successfully updated." }
        format.json { render :show, status: :ok, location: @chatroom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chatroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chatrooms/1 or /chatrooms/1.json
  def destroy
    @chatroom.destroy

    respond_to do |format|
      format.html { redirect_to chatrooms_url, notice: "Chatroom was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chatroom
      @chatroom = Chatroom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chatroom_params
      params.require(:chatroom).permit(:name)
    end
end
