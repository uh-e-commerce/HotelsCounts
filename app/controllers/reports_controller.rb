class ReportsController < ApplicationController
  require 'roo-xls'

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
    @hotel = Hotel.find_by(params[:hotel_id])
    @report = @hotel.reports.new
  end

  def create_report
    @hotel = Hotel.find_by(params[:hotel_id])
    @report = @hotel.reports.new(report_params)

    antiguedad = Report.find_by(id: params["report"]["antiguedad_id"].to_i)
    balance = Report.find_by(id: params["report"]["balance_id"].to_i)

    doc_antiguedad = Roo::Spreadsheet.open("#{antiguedad.report_path}.xls", extension: :xlsx)
    doc_balance = Roo::Spreadsheet.open("#{balance.report_path}.xls", extension: :xlsx)
    # doc_ejemplo = Roo::Spreadsheet.open('./docs/ejemplo.xls', extension: :xls) #No da Error

    # Creating report...
    doc_report = Spreadsheet::Workbook.new
    sheet1_doc_report = doc_report.create_worksheet

    #Testing...
    # puts doc_balance.column 3 #Show the third column that show up the name of companies
    # puts (doc_balance.column(C)[10]).to_s #Example of element of a column
    # sheet1_doc_report[C,1] = (doc_balance.column(C)[10]).to_s
    # puts (doc_balance.column(C)[10]).class.name #Example of element of a column

    #Building report...
    add_column(sheet1_doc_report,C, 1, doc_balance)
    add_column(sheet1_doc_report,H, E, doc_balance)
    add_column(sheet1_doc_report,G, F, doc_balance)
    add_column(sheet1_doc_report,G, M, doc_antiguedad)
    add_column(sheet1_doc_report,I, O, doc_antiguedad)
    add_column(sheet1_doc_report,J, P, doc_antiguedad)
    add_column(sheet1_doc_report,Q, K, doc_antiguedad)

    ### From doc_atiguedad doing (column E) + (column F)
    col_E = doc_antiguedad.column(E)
    col_F = doc_antiguedad.column(F)
    # puts("len of col_E = #{col_E.length} and col_F = #{col_F.length}")
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
    # sheet1_doc_report.column(L).push = doc.antiguedad.column(E+F) #TODO: Sumar estas dos columnas
    # sheet1_doc_report.column(R).push = doc.antiguedad.column(0) #TODO: Poner en cero esta columna

    # #Saving report...
    doc_report.write "/spreadsheet_files/#{params[:report_name]}.xls"
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
      params.require(:report).permit(:date, :end_date, :category_id, :excel)
    end
end
