module ApplicationHelper
    def sortable(column, title = nil)
        title ||= column.titleize
        css_class = (column == sort_column) ? "current #{sort_direction}" : nil
        direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
        
        if request.fullpath.include?(column)
            triangle = (direction == "asc") ? "▼" : "▲" 
            link_to title + triangle, {:sort=> column, :direction => direction} , {:class => css_class}
        else
            link_to title, {:sort=> column, :direction => direction} , {:class => css_class}
        end
    end

    # FIXME: 検索結果を表示している場合は検索条件をviewに返すように
    # def search_condition
    #     if request.fullpath.include?("commit=Search")
    #         binding.pry
    #         origin = request.fullpath.split('&')
    #         con = []
    #         origin.each do |o|
    #             con << { key: o.split("=").first, value: o.split("=").second}
    #         end

    #         res = []        
    #         con.each do |c|
    #             if c[:value] != nil
    #                 res << c
    #             end
    #         end
    #         res
    #     else
    #         "タスク一覧"
    #     end
    # end

end