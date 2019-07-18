class ApplicationController < ActionController::Base

  def add_column(sheet, from, to, from_doc)
    from_doc.column(from).each_with_index do |member, index|
      sheet[index,to-1] = member
    end
  end

end
