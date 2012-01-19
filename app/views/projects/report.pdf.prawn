pdf=Prawn::Document.new(:page_layout =>:landscape)

pdf.text 'Integration Group – Weekly Project Status Summary'
pdf.text "Week of: #{@start_date} - #{@one_week_later}"

list_headers = [["Project", "Project Manager", "Technical Lead", "Status", "Due Date"]] 

list_tbd = @projects_tbd.map do |project|
  [
                project.name,
                project.get_user(project.project_manager),
                project.get_user(project.technical_lead),
                project.status,
                project.due_date
  ]
end

list_os = @projects_os.map do |project|
  [
                project.name,
                project.get_user(project.project_manager),
                project.get_user(project.technical_lead),
                project.status,
                project.due_date
  ]
end

pdf.table list_headers + [['To be delivered','','','','']] + list_tbd + [['Ongoing support','','','','']] + list_os, 
  :row_colors => ["FFFFFF", "DDDDDD"]

