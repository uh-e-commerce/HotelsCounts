class ReportsController < ApplicationController
  require 'roo-xls'

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  def build_report
    @balance_reports = Report.all.find_by(category_id: 1)
    @antiquity_report = Report.all.find_by(category_id: 2)

    @hotel = Hotel.find_by(params[:hotel_id])
  end


  #Auxiliar function
  def add_column(sheet, from, to, from_doc)
    from_doc.column(from).each_with_index do |member, index|
      sheet[index,to-1] = member #Name of Agency
    end
  end
  
  def create_report(doc_balance_path, doc_antiquity_path)
    # Reading documents...
    doc_antiquity = Roo::Spreadsheet.open(doc_antiquity_path, extension: :xlsx)
    doc_balance = Roo::Spreadsheet.open(doc_balance_path, extension: :xlsx)
    
    #Creating constant...
    C = 3 #Agencies
    E = 5
    F = 6
    G = 7
    H = 8
    I = 9
    J = 10
    K = 11
    L = 12
    M = 13
    N = 14
    O = 15
    P = 16
    Q = 17
    R = 18 

    # Creating report...
    doc_report = Spreadsheet::Workbook.new
    sheet1_doc_report = doc_report.create_worksheet

    #Building report...
    add_column(sheet1_doc_report,C, 1, doc_balance)
    add_column(sheet1_doc_report,H, E, doc_balance)
    add_column(sheet1_doc_report,G, F, doc_balance)
    add_column(sheet1_doc_report,G, M, doc_antiquity)
    add_column(sheet1_doc_report,I, O, doc_antiquity)
    add_column(sheet1_doc_report,J, P, doc_antiquity)
    add_column(sheet1_doc_report,Q, K, doc_antiquity)

    ### From doc_atiquity doing (column E) + (column F)
    col_E = doc_antiquity.column(E)
    col_F = doc_antiquity.column(F)
    col_sum = []
    len = col_E.length
    0.upto(len-1) do |i| 
        begin
            a = col_E[i].to_f
            b = col_F[i].to_f
            col_sum << (a + b).to_s
        rescue => exception
            col_sum << "".to_s   
        end
    end

    col_sum.each_with_index do |member, index|
        sheet1_doc_report[index,L-1] = member
    end
    #TODO: Make zero to R column

    # #Saving report...
    doc_report.write './docs/report.xls'
  end

  # GET /reports/new
  def new
    @hotel = Hotel.find_by(params[:hotel_id])
    @report = @hotel.reports.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @hotel = Hotel.find_by(params[:hotel_id])
    @report = @hotel.reports.new(report_params)

    respond_to do |format|
      if @report.save
        flash[:success] = "Report created successfuly."
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        flash[:alert] = "Errors where found."
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to report_path(@report.id), notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: report_path(@report.id) }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:date, :category_id, :spreadsheet)
    end
end
