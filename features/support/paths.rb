module NavigationHelper
  def path_to(page_name)
    case page_name
    when "Employees' home"
      employees_path
    when "Employees' events"
      events_path
    when 'leaves'
      leaves_path
    end
  end
end
World(NavigationHelper)
