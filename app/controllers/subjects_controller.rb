class SubjectsController < ApplicationController
  before_filter :find_client


  # GET /subjects
  # GET /subjects.xml
  def index
    @subjects = @client.subjects

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subjects }
    end
  end

  # GET /subjects/1
  # GET /subjects/1.xml
  def show
    @subject = @client.subjects.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subject }
    end
  end

  # GET /subjects/new
  # GET /subjects/new.xml
  def new
    @subject = Subject.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subject }
    end
  end

  # GET /subjects/1/edit
  def edit
    @subject = @client.subjects.find(params[:id])
  end

  # POST /subjects
  # POST /subjects.xml
  def create
    @subject = Subject.new(params[:subject])

    respond_to do |format|
      if @client.subjects << @subject
        flash[:notice] = 'Subject was successfully created.'
        format.html { redirect_to client_subject_url(@client, @subject) }
        format.xml  { render :xml => @subject, :status => :created, :location => [@client, @subject] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subject.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subjects/1
  # PUT /subjects/1.xml
  def update
    @subject = @client.subjects.find(params[:id])

    respond_to do |format|
      if @subject.update_attributes(params[:subject])
        flash[:notice] = 'Subject was successfully updated.'
        format.html { redirect_to client_subject_url(@client, @subject) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subject.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.xml
  def destroy
    @subject = @client.subjects.find(params[:id])
    @subject.destroy

    respond_to do |format|
      flash[:notice] = 'Subject was successfully removed.'      
      format.html { redirect_to(client_subjects_url(@client)) }
      format.xml  { head :ok }
    end
  end

private

  def find_client
    @client_id = params[:client_id]
    redirect_to clients_url unless @client_id
    @client = Client.find(@client_id)
  end


end
