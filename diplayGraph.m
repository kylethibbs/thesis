function diplayGraph(handles, coef)   
        
    if ~isempty(handles.Axes.Graph.Children)
        delete(handles.Axes.Graph.Children)
    end
    
    if isempty(coef)
        return
    end 
        
    % Seperate the coefficients to get the numbers
    coef = strsplit(coef{1},{',','\t',' '});
    if isempty(coef{end})
     coef = coef(1:end-1);
    end
    
    
    if strcmp(handles.ButtonGroup.Mode.SelectedObject.String,'True Value')
        switch handles.ButtonGroup.Degree.SelectedObject.String
            case 'Quadratic'
                selectedSize = 3;
            case 'Cubic'
                selectedSize = 4;
            case 'Quartic'
                selectedSize = 5;
        end
        
        if length(coef) ~= selectedSize
            warndlg(['The number of coefficients is incorrect for a ', handles.ButtonGroup.Degree.SelectedObject.String,' function.'])
            return
        end
    
    end   

    for i = 1:length(coef)
        graphCoef(1,i) = str2double(coef{1,i});
    end 
    
    x = -50:.01:50;
    y = polyval(graphCoef,x);
    
    line('Parent',handles.Axes.Graph,'XData',x,'YData',y,'Tag','polyLine');

end

