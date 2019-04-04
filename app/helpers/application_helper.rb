module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    
    if request.fullpath.include?(column)
      sort_direction_display = (direction == "asc") ? "▼" : "▲" 
      link_to title + sort_direction_display, {:sort=> column, :direction => direction} , {:class => css_class}
    else
      link_to title, {:sort=> column, :direction => direction} , {:class => css_class}
    end
  end
  
  def search_condition
    if request.fullpath.include?("commit=Search")
      search_conditions_hash = [] 

      request.fullpath.split('&')[1..4].each do |condition|
        search_conditions_hash << { key: condition.split("=").first, value: condition.split("=").second }
      end

      response_text = ""
      search_conditions_hash.each do |condition| 
        if condition[:value] != nil 
          response_text << convert(condition[:key]) + "=\"#{URI.decode(condition[:value])}\"  " 
        end
      end
      response_text == "" ? "" : response_text << "での検索結果："
    end
  end

  def convert(key_string)
    key_string.gsub(/#{CONVERSION.keys.join('|')}/, CONVERSION)
  end    

  private
  CONVERSION = { "name" => "名称", "description" => "詳しい説明", "label" => "ラベル", "status" => "進捗" }
end