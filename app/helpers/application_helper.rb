module ApplicationHelper
  
  def getMenuLabel(controller)
    
    label = ""
    
    action = controller.action_name
    controller = controller.controller_name
    
    if(controller == "statuses")
      label = "Status"
    elsif(controller == "policy_types")
      label = "Policy Type"
    elsif(controller == "document_types")
      label = "Document Type"
    elsif(controller == "submission_types")
      label = "Submission Type"
    elsif(controller == "policy_types")
      label = "Policy Type"
    elsif(controller == "forms" && action == "generateReport")
      label = "Generate Report"
    elsif(controller == "mainforms" && action == "showusers")
      label = "Manage Users"
    elsif(controller == "mainforms" && action == "showsessions")
      label = "Active Sessions"
    elsif(controller == "users" && action == "new")
      label = "Manage Users"
    else
      label = "Forms Tracking"
    end
    
    label
  end
end
